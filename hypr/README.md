# hypr

Standalone Hyprland config — no distro layer. Uses Hyprland's native Lua
config (`hl.*` API, see `/usr/share/hypr/stubs/hl.meta.lua` after install),
not a framework on top of it.

## Install (Arch)

Everything Hyprland-specific (`hyprland`, `hypridle`, `hyprlock`,
`hyprsunset`, `hyprpicker`, `hyprshot`, `xdg-desktop-portal-hyprland`,
`uwsm`) is in [`../packages/pacman-hyprland.txt`](../packages/README.md),
kept out of the default install since not every machine here runs
Hyprland:

```bash
grep -v '^#' ../packages/pacman-hyprland.txt | xargs sudo pacman -S --needed
```

The rest of what `bindings.lua` calls (`wofi`, `wlogout`, `mako`,
`cliphist`, `wl-clipboard`, `brightnessctl`, `playerctl`, `udiskie`,
`nautilus` for the file-manager bind) is compositor-agnostic and already
in `../packages/pacman.txt`.

## Copy

```bash
mkdir -p ~/.config/hypr
cp hyprland.lua envs.lua monitors.lua input.lua looknfeel.lua windowrules.lua \
   bindings.lua autostart.lua hypridle.conf hyprlock.conf hyprsunset.conf xdph.conf \
   ~/.config/hypr/
```

`hyprmoncfg-monitors.lua` isn't here on purpose — it's generated per-machine
by [hyprmoncfg](https://github.com/PaperBoardOfficial/hyprmoncfg) (optional)
and `hyprland.lua` only loads it if present. Without it, edit `monitors.lua`
directly.

## Apply

```bash
hyprctl reload
hyprctl configerrors   # check for errors after reload
```

## Notes

- `hyprlock.conf` has a placeholder wallpaper path
  (`~/Pictures/wallpaper.png`) — point it at a real image, or drop the
  `background.path` line to keep the solid Tokyo Night background.
- Night light (`hyprsunset`) is wired for manual toggle
  (`SUPER+CTRL+N`) but not autostarted — add `hl.exec_cmd("hyprsunset")` to
  `autostart.lua` if you want it always on.
