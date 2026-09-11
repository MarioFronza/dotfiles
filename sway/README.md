# sway

Sway config for the ThinkPad. Status bar is `waybar`, not the native
swaybar. Waybar's own config isn't tracked in this repo yet.

## Install (Arch)

`sway`, `swaybg`, `swayidle`, and `wmenu` (launcher, bound to
`$mod+space`) all come from selecting the Sway profile in `archinstall`
(see [`../QUICKSTART.md`](../QUICKSTART.md)) — nothing to install here.

Everything else the config below calls (`waybar`, `grim`, `playerctl`,
`brightnessctl`, `bluetuith`) is already in
[`../packages/pacman.txt`](../packages/README.md).

## Copy

| File | Target |
| --- | --- |
| [`config`](https://github.com/MarioFronza/dotfiles/blob/main/sway/config) | `~/.config/sway/config` |

```bash
mkdir -p ~/.config/sway
vim ~/.config/sway/config
```

## Apply

```bash
swaymsg reload
```

## Notes

- **Wallpaper**: `output * bg ~/Pictures/Wallpapers/dinossaurs-v2/04-parasaurolophus-rainforest-night.png fill` is hardcoded to my own file — point it at whatever you have.
- **Ctrl/CapsLock swap is ThinkPad-specific**: the `input
  "1:1:AT_Translated_Set_2_keyboard" { xkb_options ctrl:swapcaps }` block
  only swaps the *internal* keyboard, so an external keyboard isn't
  affected. On another machine, find the right device name with `swaymsg
  -t get_inputs` and update the identifier, or drop the block entirely.
- Volume/mic keys go through `pactl` (PulseAudio/pipewire-pulse), not `wpctl`.
- No `swaylock`/`swayidle` set up currently — the idle section in the
  config is left commented as a starting point if that changes.
- `$mod+Shift+b` opens `bluetuith` in a terminal for Bluetooth management.
