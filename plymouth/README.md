# plymouth

Flexoki Dark Plymouth theme (Arch Linux logo, Flexoki Dark colors) — the
screen shown while typing the LUKS disk-decryption password on boot.
Matches [`../sway/swaylock.conf`](../sway/README.md) so the boot unlock
screen and the desktop lock screen look the same.

## Install (Arch)

Already in [`../packages/pacman.txt`](../packages/README.md) is
`plymouth`.

## Copy

```bash
sudo mkdir -p /usr/share/plymouth/themes/flexoki-dark
sudo cp bullet.png entry.png lock.png logo.png progress_bar.png \
        progress_box.png flexoki-dark.plymouth flexoki-dark.script \
        /usr/share/plymouth/themes/flexoki-dark/
sudo plymouth-set-default-theme -R flexoki-dark
```

`-R` rebuilds the initramfs; without it the new theme won't show up on
next boot.

## Enable Plymouth itself (if not already on)

1. Add `plymouth` to `HOOKS` in `/etc/mkinitcpio.conf`, **after**
   `keymap`/`consolefont` and **before** `encrypt` (order matters — it
   needs the keymap loaded to type the password, and must come before
   the encrypt hook draws its own default prompt):
   ```
   HOOKS=(base udev autodetect microcode modconf kms keyboard keymap consolefont block plymouth encrypt filesystems fsck)
   ```
2. Add `quiet splash loglevel=3 vt.global_cursor_default=0` to the kernel
   cmdline (`/etc/kernel/cmdline` for Limine, or your bootloader's
   equivalent — the `cryptdevice=`/`root=` part is disk-specific to each
   machine, don't copy it from here).
3. `sudo mkinitcpio -P` to rebuild.

## Notes

- This only re-themes the LUKS unlock screen. It doesn't touch autologin
  or session locking — that's `swayidle`/`swaylock` in
  [`../sway/`](../sway/README.md).
