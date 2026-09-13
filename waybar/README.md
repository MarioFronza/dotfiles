# waybar

Status bar for [`../sway/`](../sway/README.md). Layout adapted from
[Omarchy](https://github.com/basecamp/omarchy)'s waybar config
(`hyprland/workspaces` → `sway/workspaces`, dropped everything tied to
Omarchy's own scripts — `custom/omarchy`, `custom/update`,
`custom/weather`, `custom/voxtype`, and the screenrecording/idle/
notification-silencing indicators). Colors are the same Tokyo Night
palette as [`../fuzzel/`](../fuzzel/README.md) and
[`../claude/themes/tokyo_night.json`](../claude/themes/tokyo_night.json).

Click actions call this machine's own TUIs instead of Omarchy's
`omarchy-launch-*` wrappers: network → `impala`, bluetooth → `bluetui`,
pulseaudio → `wiremix` (right-click: mute via `pamixer -t`), battery →
the `power` shell function ([`../zsh/functions`](../zsh/functions)).

`waybar` itself is installed via [`../packages/`](../packages/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/waybar
cp waybar/config.jsonc waybar/style.css ~/.config/waybar/
```

## Apply

```bash
pkill waybar; waybar &
```

(or just `swaymsg reload`, which restarts it along with the rest of
the Sway config)

## Notes

- Icons are Nerd Font glyphs from the private-use area — **copy the
  files with `cp`, don't retype them**. Hand-typing them (even via an
  editor) can silently turn a glyph into an empty string with no
  visible diff, which looks identical in most terminals/renderers but
  makes that bar segment disappear. This actually happened once with
  the `bluetooth` and `pulseaudio` icons while adapting this config —
  not obvious until checked byte-by-byte (`xxd`).
- `pulseaudio`'s icon comes from `format-icons.headphone` here, not
  `.default` — the default sink on this machine is literally named
  "Headphones" (`wpctl status`), so the headphone-specific field wins.
  If a different icon is missing, check which named field
  (`headphone`/`headset`/`default`) actually matches your sink first.
- No `persistent-workspaces`: only workspaces that currently exist are
  shown, matching [`../sway/scripts/monitor-setup.sh`](../sway/scripts/monitor-setup.sh)'s
  dynamic 1-9/10 assignment rather than hardcoding a fixed set.
