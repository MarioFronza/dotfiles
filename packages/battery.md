# Battery (ThinkPad charge thresholds)

`thinkpad_acpi` (built into the kernel, already loaded on boot) exposes
charge thresholds directly on `BAT0` — no TLP, tp-smapi, or extra
package needed.

## Cap charging at 80% (resume at 75%)

Useful when the laptop stays plugged in most of the day: caps time
spent at 100%, the state that stresses Li-ion batteries the most. A
udev rule reapplies the thresholds every time the battery device
appears (boot, resume), so nothing needs to run in the background.

```bash
sudo tee /etc/udev/rules.d/99-battery-charge-threshold.rules <<'EOF'
ACTION=="add", SUBSYSTEM=="power_supply", KERNEL=="BAT0", ATTR{charge_control_start_threshold}="75", ATTR{charge_control_end_threshold}="80"
EOF
sudo udevadm control --reload
sudo udevadm trigger --action=add /sys/class/power_supply/BAT0
```

## Verify

```bash
cat /sys/class/power_supply/BAT0/charge_control_start_threshold
cat /sys/class/power_supply/BAT0/charge_control_end_threshold
```

## How it works

Enforced by the embedded controller (EC) itself, not by Linux polling
in the background:

- **Plugged in**: charges normally up to 80%, then charging stops —
  the laptop runs off AC pass-through, not touching the battery. If
  usage drags it back below 75% while still plugged in, the EC resumes
  charging up to 80% and stops again. The 5-point gap avoids
  rapid on/off cycling right at the edge.
- **Unplugged**: thresholds don't apply — it discharges normally with
  use, no forced minimum.
- **The udev rule only fires once**, when `BAT0` appears (boot/resume).
  It's not a running process — some ThinkPad ECs forget the threshold
  on a cold boot, so this just guarantees it's reapplied every time.

To charge to 100% once (e.g. before traveling):

```bash
echo 100 | sudo tee /sys/class/power_supply/BAT0/charge_control_end_threshold
```

Lasts until the next boot, when the udev rule resets it back to 80%.
