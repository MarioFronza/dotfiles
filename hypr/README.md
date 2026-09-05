# hypr

Standalone Hyprland config — no distro layer. Uses Hyprland's native Lua
config (`hl.*` API, see `/usr/share/hypr/stubs/hl.meta.lua` after install),
not a framework on top of it.

## Install (Arch)

```bash
sudo pacman -S hyprland hypridle hyprlock hyprsunset xdg-desktop-portal-hyprland \
  wofi wlogout mako hyprpicker udiskie brightnessctl playerctl cliphist wl-clipboard nautilus
yay -S hyprshot
```

What each one is for:
- `wofi` — app launcher (`SUPER+SPACE`) and clipboard picker
- `wlogout` — power menu (`SUPER+ESCAPE`)
- `mako` — notification daemon (autostart)
- `hyprpicker` — color picker (`SUPER+PRINT`)
- `udiskie` — automount removable drives (autostart)
- `brightnessctl` / `playerctl` — brightness and media keys
- `cliphist` / `wl-clipboard` — clipboard history (`SUPER+CTRL+V`)
- `hyprshot` — screenshots (`PRINT`, `SUPER+SHIFT+S`)
- `nautilus` — file manager (`SUPER+SHIFT+F`), swap the bind in `bindings.lua` if you use something else

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
