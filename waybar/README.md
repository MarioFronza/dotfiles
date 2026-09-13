# waybar

Status bar for [`../sway/`](../sway/README.md), `sway/workspaces` on
the left, `clock` centered, tray/bluetooth/network/pulseaudio/battery
on the right. Colors are the same
[Flexoki](https://github.com/kepano/flexoki) dark palette as
[`../fuzzel/`](../fuzzel/README.md).

Click actions call this machine's own TUIs: network → `impala`,
bluetooth → `bluetui`, pulseaudio → `wiremix` (right-click: mute via
`pamixer -t`), battery → the `power` shell function
([`../zsh/functions`](../zsh/functions)).

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
  makes that bar segment disappear. This happened three times while
  adapting this config (`bluetooth`, `pulseaudio`, and the tray's own
  expand arrow) — not obvious until checked byte-by-byte (`xxd`), and
  in the tray's case it also looked like a spacing bug (a much bigger
  gap before the next module) rather than a missing icon.
- `group/tray-expander` hides `tray` behind an arrow (`custom/expand-icon`),
  revealed on hover (`drawer.click-to-reveal` defaults to `false`). The
  hidden module gets `drawer.children-class` (`tray-group-item`) — style
  that class directly (`margin: 0; padding: 0;`), not just `#tray-expander`;
  the group wrapper's own box isn't where the extra spacing came from.
- `pulseaudio`'s icon comes from `format-icons.headphone` here, not
  `.default` — the default sink on this machine is literally named
  "Headphones" (`wpctl status`), so the headphone-specific field wins.
  If a different icon is missing, check which named field
  (`headphone`/`headset`/`default`) actually matches your sink first.
- No `persistent-workspaces`: only workspaces that currently exist are
  shown, matching [`../sway/scripts/monitor-setup.sh`](../sway/scripts/monitor-setup.sh)'s
  dynamic 1-9/10 assignment rather than hardcoding a fixed set.
