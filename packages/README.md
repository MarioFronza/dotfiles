# packages

Every pacman/AUR package this machine had installed, mapped for a fresh
Arch install. GPU drivers are split out by vendor so you only install
the one that matches the actual hardware.

```bash
cd packages
./install.sh [amd|intel|nvidia]
```

`base`, `linux`, and `linux-firmware` aren't listed anywhere — those come
from the Arch install itself. Review the bootloader section in
`pacman.txt` too (assumes Limine; swap for grub/systemd-boot if that's
what the installer set up).

## Files

- `pacman.txt` / `aur.txt` — everything compositor-agnostic
- `gpu-amd.txt` / `gpu-intel.txt` / `gpu-nvidia.txt` — pick one, open-source
  drivers only (see the comments in `gpu-nvidia.txt` about `nvidia-open`
  needing a Turing-or-newer card)
- [`wifi-bluetooth.md`](wifi-bluetooth.md) — enabling `iwd`/`impala` and
  `bluetooth`/`bluetuith` after install.sh (no NetworkManager here)

## Dropped entirely

A handful of installed packages had no public AUR or official-repo
equivalent under the same name (checked against the AUR API, not
guessed): a wallpaper-based dynamic theming tool (moot now that everything
here is hardcoded to Tokyo Night), an Apple Studio Display brightness
tool, and two small niche CLI utilities. Get them from their own GitHub
releases directly if you want them.
