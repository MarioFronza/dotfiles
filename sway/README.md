# sway

Sway config for the ThinkPad. Status bar is `waybar`, not the native
swaybar. Waybar's own config isn't tracked in this repo yet.

`sway`, `swaybg`, `swayidle`, and `wmenu` (launcher, bound to
`$mod+space`) all come from selecting the Sway profile in `archinstall`
(see [`../QUICKSTART.md`](../QUICKSTART.md)). Everything else the config
below calls (`waybar`, `wireplumber`/`wpctl`, `grim`, `playerctl`,
`brightnessctl`, `bluetuith`) is installed via
[`../packages/`](../packages/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/sway
cp sway/config ~/.config/sway/config
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
- Volume/mic keys go through `wpctl` (WirePlumber), capped at 100%
  (`-l 1.0`) on raise — `pactl set-sink-volume +N%` has no ceiling and
  will boost past unity gain into distortion.
- No `swaylock`/`swayidle` set up currently — the idle section in the
  config is left commented as a starting point if that changes.
- `$mod+Shift+b` opens `bluetuith` in a terminal for Bluetooth management.
