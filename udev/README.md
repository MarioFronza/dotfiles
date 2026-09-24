# udev

System-level `udev` rules for the ThinkPad. These are the only files in this
repo that land outside `$HOME`, so every step here needs `sudo`.

**Laptops only — skip this folder on a desktop.** Everything here exists
because closing the lid and undocking put the machine to sleep. A desktop
never reaches that situation and gains nothing from the rule.

## Copy

```bash
sudo cp udev/90-usb-wakeup.rules /etc/udev/rules.d/
```

## Apply

```bash
sudo udevadm control --reload
sudo udevadm trigger --subsystem-match=usb --action=add
```

`control --reload` re-reads the rules, `trigger` re-processes the USB devices
that are already connected so the rule takes effect without a reboot.

## Verify

```bash
grep . /sys/bus/usb/devices/usb*/power/wakeup
```

All four root hubs should read `enabled`.

## Notes

- **`90-usb-wakeup.rules` makes plugging the dock in wake the machine.** This
  laptop only supports `s2idle` (there is no `deep`/S3 — check with
  `cat /sys/power/mem_sleep`). Closing the lid while docked is fine, but
  unplugging from that state leaves no display at all, so `systemd-logind`
  stops treating the machine as docked and suspends it. Plugging the dock back
  in then did nothing, because a sleeping machine cannot notice a connection,
  and the lid had to be opened to wake it.
- The wake path was blocked at exactly one place. The xHCI controllers
  (`/sys/bus/pci/devices/0000:00:{0d,14}.0/power/wakeup`) and the Thunderbolt
  domains were already `enabled`, but wake-on-*connect* is decided by the root
  hub, and all four shipped `disabled`. The port noticed the dock arriving and
  had no permission to raise a wake event.
- **The rule is deliberately device-agnostic.** It matches root hubs by
  `1d6b` — the Linux Foundation vendor id every root hub reports — so it
  describes the ThinkPad, never a particular dock. Any dock, any port, any USB
  device behaves the same way. Scoping to a dock's own `idVendor`/`idProduct`
  cannot work here: while the dock is unplugged, that device does not exist,
  so there is nothing for such a rule to arm.
- Narrowing to only the buses the dock currently lands on is also a bad trade.
  The USB-C ports split one physical cable across two controllers (USB2 pairs
  route to the chipset xHCI, USB3 pairs to the USB4 one), so which root hubs
  are involved depends on the port used.
- **If the machine starts waking on its own**, suspect a leaf device before
  this rule. Check what else is allowed to wake things:

  ```bash
  grep . /sys/bus/usb/devices/*/power/wakeup
  ```

  The dock's Realtek `r8152` ethernet enables wake-on-LAN by itself and is the
  usual culprit; the keyboard is normally wanted (a keypress wakes the
  machine). Neither is set by this rule.
- **Revert:** `sudo rm /etc/udev/rules.d/90-usb-wakeup.rules`, then reboot.

See [`../sway/README.md`](../sway/README.md) for the lid and external-monitor
behavior this pairs with.
