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

The rest of what `bindings.lua` calls (`wofi`, `mako`, `cliphist`,
`wl-clipboard`, `brightnessctl`, `playerctl`, `udiskie`, `nautilus` for
the file-manager bind) is compositor-agnostic and already in
`../packages/pacman.txt`. `wlogout` is the one exception — it's AUR-only,
see `../packages/aur.txt`.

## Copy

All go to `~/.config/hypr/`:
[`hyprland.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/hyprland.lua),
[`envs.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/envs.lua),
[`monitors.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/monitors.lua),
[`input.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/input.lua),
[`looknfeel.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/looknfeel.lua),
[`windowrules.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/windowrules.lua),
[`bindings.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/bindings.lua),
[`autostart.lua`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/autostart.lua),
[`hypridle.conf`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/hypridle.conf),
[`hyprlock.conf`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/hyprlock.conf),
[`hyprsunset.conf`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/hyprsunset.conf),
[`xdph.conf`](https://github.com/MarioFronza/dotfiles/blob/main/hypr/xdph.conf)

```bash
mkdir -p ~/.config/hypr
vim ~/.config/hypr/hyprland.lua
```

`hyprmoncfg-monitors.lua` isn't here on purpose — it's generated per-machine
by [hyprmoncfg](https://github.com/crmne/hyprmoncfg) (optional)
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
