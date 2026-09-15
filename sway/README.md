# sway

Sway config for the ThinkPad. Status bar is [`waybar`](../waybar/README.md),
not the native swaybar.

`sway`, `swaybg`, and `swayidle` come from selecting the Sway profile in
`archinstall` (see [`../QUICKSTART.md`](../QUICKSTART.md)) — that
profile also installs `wmenu` and `foot`, neither used; remove both
(`sudo pacman -Rns wmenu foot`). Terminal is `alacritty` (`$term`),
launcher bound to `$mod+space` is [`fuzzel`](../fuzzel/README.md),
notifications are [`mako`](../mako/README.md), volume/brightness OSD
is [`swayosd`](../swayosd/README.md). Everything else the config below
calls (`wireplumber`, `grim`, `playerctl`, `jq`) is installed via
[`../packages/`](../packages/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/sway
cp sway/config ~/.config/sway/config
cp -r sway/scripts ~/.config/sway/
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
- Volume/mic/brightness keys go through `swayosd-client`, which shows
  the on-screen indicator and wraps WirePlumber/brightnessctl itself —
  capped at 100% volume (`max_volume` in
  [`../swayosd/`](../swayosd/README.md)), no boost past unity gain.
- No `swaylock`/`swayidle` set up currently — the idle section in the
  config is left commented as a starting point if that changes.
- `$mod+Shift+b` opens `bluetui` in a terminal for Bluetooth management.
- **Mouse has no acceleration curve** (`input type:pointer { accel_profile
  flat }`) — 1:1 with physical movement.
- **Multi-monitor**: `scripts/monitor-setup.sh` runs once at Sway startup
  and again on every output hotplug. Whichever monitor isn't the laptop
  panel (`eDP-1`) becomes the main surface for workspaces 1-9; `eDP-1`
  always keeps workspace 10 — no per-monitor identifier needed for this
  part. To pin a specific resolution/refresh rate for a monitor you use
  often, add an `output "<make> <model> <serial>"` block in `config`
  (get the identifier from `swaymsg -t get_outputs`) — optional,
  otherwise Sway just uses that monitor's own default mode.
- **Lid switch**: `bindswitch lid:on/off` disables/enables `eDP-1` when
  the lid closes/opens, instead of leaving the panel lit. Suspending on
  lid-close while docked is already skipped by systemd-logind's
  `HandleLidSwitchDocked=ignore` default — no config needed there.
