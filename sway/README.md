# sway

Sway config for the ThinkPad. Tokyo Night everywhere (bar, borders,
swaylock), no icons in the status bar — just plain text.

## Install (Arch)

`sway`, `swaybg`, `swaylock`, `swayidle`, and `wmenu` (launcher, bound to
`$mod+d`/`$mod+space`) all come from selecting the Sway profile in
`archinstall` (see [`../QUICKSTART.md`](../QUICKSTART.md)) — nothing to
install here.

Everything else the config below calls (`mako`, `grim`/`slurp`,
`wl-clipboard`, `brightnessctl`, `playerctl`, `udiskie`, `wpctl` from
`wireplumber`) is already in [`../packages/pacman.txt`](../packages/README.md).

## Copy

| File | Target |
| --- | --- |
| [`config`](https://github.com/MarioFronza/dotfiles/blob/main/sway/config) | `~/.config/sway/config` |
| [`statusbar.sh`](https://github.com/MarioFronza/dotfiles/blob/main/sway/statusbar.sh) | `~/.config/sway/statusbar.sh` |
| [`swaylock.conf`](https://github.com/MarioFronza/dotfiles/blob/main/sway/swaylock.conf) | `~/.config/swaylock/config` |

```bash
mkdir -p ~/.config/sway ~/.config/swaylock
vim ~/.config/sway/config
chmod +x ~/.config/sway/statusbar.sh
```

## Apply

```bash
swaymsg reload
```

## Notes

- **Wallpaper**: `output * bg ~/Pictures/wallpaper.jpg fill` is a
  placeholder — point it at a real image.
- **Ctrl/CapsLock swap is ThinkPad-specific**: the `input
  "1:1:AT_Translated_Set_2_keyboard" { xkb_options ctrl:swapcaps }` block
  only swaps the *internal* keyboard, so an external keyboard isn't
  affected. On another machine, find the right device name with `swaymsg
  -t get_inputs` and update the identifier, or drop the block entirely.
- Status bar has no icons on purpose (network/volume/battery/date as
  plain text) — see `statusbar.sh`. Volume refreshes instantly on change
  via `pactl subscribe`, not on the 5s poll.
