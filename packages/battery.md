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
