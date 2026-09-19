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
calls (`wireplumber`, `grim`, `playerctl`, `jq`, `gum`) is installed via
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
- `$mod+Shift+b` opens `bluetui` in a terminal for Bluetooth management.
- `$mod+Shift+p` opens `perf` (the `zsh/functions` TUI over the
  power-profiles-daemon dbus API) in a terminal, to switch CPU perf
  profile — the waybar icon (`custom/power-profile`) is read-only by
  design, so this is the only way to change it.
- `$mod+Shift+Escape` opens `power` (the `zsh/functions` TUI for
  Lock/Suspend/Reboot/Poweroff) in a terminal.
- `$mod+Shift+w` opens `impala` (wifi), `$mod+Shift+a` opens `wiremix`
  (audio) — same `zsh/aliases` tools as `wifi`/`audio` from a terminal.
- **Mouse has no acceleration curve** (`input type:pointer { accel_profile
  flat }`) — 1:1 with physical movement.
- **Multi-monitor**: `scripts/monitor-setup.sh` runs once at Sway startup
  and again on every output hotplug. Whichever monitor isn't the laptop
  panel (`eDP-1`) becomes the main surface for workspaces 1-9, set to its
  highest advertised resolution (refresh rate as tiebreaker) — no
  per-monitor identifier or hardcoded `mode` block needed. `eDP-1` always
  keeps workspace 10.
- **Lid switch**: `scripts/lid-close.sh` disables `eDP-1` on lid close
  only when an external monitor is active (docked) — avoids leaving the
  panel lit while docked, where systemd-logind's
  `HandleLidSwitchDocked=ignore` default means no suspend happens.
  Undocked, lid close leaves `eDP-1` alone and suspends normally (the
  panel blanks via hardware, not sway); disabling it there raced with
  `idle-lock.sh`'s `before-sleep` lock, sometimes leaving a black,
  unresponsive screen on resume. `bindswitch lid:off output eDP-1
  enable` re-enables unconditionally either way. See
  [`../swaylock/README.md`](../swaylock/README.md) for the lock itself.
