# waybar

Status bar for [`../sway/`](../sway/README.md), started by sway itself
(`bar { swaybar_command waybar }` in [`../sway/config`](../sway/config)).
Based on the stock config shipped by the `waybar` package
(`/etc/xdg/waybar/`), trimmed down and restyled.

`sway/workspaces`, `sway/mode`, `sway/scratchpad`, `custom/media` on
the left, `clock` centered. On the right: `mpd`, `pulseaudio`,
`network`, `power-profiles-daemon`, `cpu`, `memory`, `battery` (+
`battery#bat2`) — separated by a dim `│`.

View-only by design: workspace and volume scrolling/clicking are
disabled, since switching workspaces and adjusting volume already
have keyboard binds in [`../sway/config`](../sway/config).

Colors are [Flexoki](https://github.com/kepano/flexoki) dark.

`waybar` itself is installed via [`../packages/`](../packages/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/waybar
cp waybar/config.jsonc waybar/style.css ~/.config/waybar/
```

## Apply

```bash
swaymsg reload
```

(sway owns the waybar process via its `bar` block — don't run
`waybar &` by hand, it'll leave a second instance running alongside
the one sway manages)

## Notes

- Icons are Nerd Font glyphs from the private-use area — **copy the
  files with `cp`, don't retype them**. Hand-typing them (even via an
  editor) can silently turn a glyph into an empty string with no
  visible diff, which looks identical in most terminals/renderers but
  makes that bar segment disappear. Not obvious until checked
  byte-by-byte (`xxd` or `python3 -c "open(path,'rb').read()"`).
