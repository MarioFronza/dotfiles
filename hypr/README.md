# hypr

Personal Hyprland overrides from the Omarchy machine — **not standalone**,
depends on Omarchy being installed (`hyprland.lua` does
`dofile(.../omarchy/default/hypr/bootstrap.lua)` and
`require("default.hypr.omarchy")`; `bindings.lua` calls Omarchy scripts
like `omarchy-menu-keybindings`, `omarchy-system-lock`, `gamer-mode`).
Kept here as personal backup/reference, not for the Sway/ThinkPad setup.

`hyprmoncfg-monitors.lua` isn't here — it's generated per-machine by
[hyprmoncfg](https://github.com/crmne/hyprmoncfg), not something to track.

## Copy

Only meaningful on a machine that already has Omarchy installed:

```bash
mkdir -p ~/.config/hypr
cp hypr/*.lua ~/.config/hypr/
```
