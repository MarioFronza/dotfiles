# sway

Sway config for the ThinkPad. Flexoki Dark everywhere (bar, borders,
swaylock), no icons in the status bar — just plain text. Alternative to
[`../hypr/`](../hypr/README.md) for machines that run Sway instead of
Hyprland.

## Install (Arch)

Sway, `swaybg`, `swaylock`, `swayidle`, and `fuzzel` are in
[`../packages/pacman-sway.txt`](../packages/README.md) (kept out of the
default install, same split as Hyprland's `pacman-hyprland.txt`):

```bash
grep -v '^#' ../packages/pacman-sway.txt | xargs sudo pacman -S --needed
```

Everything else the config below calls (`mako`, `grim`/`slurp`,
`wl-clipboard`, `brightnessctl`, `playerctl`, `udiskie`, `wlogout`,
`wpctl` from `wireplumber`) is already in
[`../packages/pacman.txt`](../packages/README.md).

## Copy

```bash
mkdir -p ~/.config/sway ~/.config/swaylock
cp config statusbar.sh ~/.config/sway/
cp swaylock.conf ~/.config/swaylock/config
chmod +x ~/.config/sway/statusbar.sh
```

## Apply

```bash
swaymsg reload
```

## Notes

- **Wallpaper**: `output * bg ~/Pictures/wallpaper.jpg fill` is a
  placeholder — point it at a real image, same convention as
  `../hypr/hyprlock.conf`.
- **Ctrl/CapsLock swap is ThinkPad-specific**: the `input
  "1:1:AT_Translated_Set_2_keyboard" { xkb_options ctrl:swapcaps }` block
  only swaps the *internal* keyboard, so an external keyboard isn't
  affected. On another machine, find the right device name with `swaymsg
  -t get_inputs` and update the identifier, or drop the block entirely.
- **swaylock.conf** points `image=` at
  `/usr/share/plymouth/themes/flexoki-dark/logo.png` — install
  [`../plymouth/`](../plymouth/README.md) first (or repoint it at any
  image) so swaylock visually matches the LUKS unlock screen.
- Status bar has no icons on purpose (network/volume/battery/date as
  plain text) — see `statusbar.sh`. Volume refreshes instantly on change
  via `pactl subscribe`, not on the 5s poll.
