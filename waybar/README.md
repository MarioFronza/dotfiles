# waybar

Status bar for [`../sway/`](../sway/README.md), started by sway itself
(`bar { swaybar_command waybar }` in [`../sway/config`](../sway/config)).
Based on the stock config shipped by the `waybar` package
(`/etc/xdg/waybar/`), trimmed down and restyled rather than rewritten
from scratch.

`sway/workspaces`, `sway/mode`, `sway/scratchpad`, `custom/media` on
the left, `clock` centered. On the right: `mpd`, `idle_inhibitor`,
`pulseaudio`, `network`, `power-profiles-daemon`, `cpu`, `memory`,
`battery` (+ `battery#bat2`), `tray` — separated by a dim `│`
(`custom/separator`) instead of a background box per module.

Removed from the stock config: `keyboard-state` (needs the `input`
group, not worth granting for a numlock/capslock indicator),
`sway/language` (redundant keyboard-layout readout), `backlight`
(the laptop panel is usually off — see
[`../sway/README.md`](../sway/README.md) — so the module just sits
empty between two separators), `temperature` (its stock icons use
Font Awesome 7 codepoints this machine's fonts don't cover, rendering
as a literal hex tofu box — not worth pulling in another font just
for one glyph), `custom/power` (removed after trying a floating
`power` TUI launcher — simpler without it).

`clock` uses `{:L%A %H:%M}`, click toggles to `{:L%d %B W%V %Y}`, no
tooltip. `pulseaudio` shows `{volume}% {icon}` only — no mic level,
no device-specific icon (the `format-icons` block only defines
`default`, so the icon reflects volume level, not output port).
`network` has its tooltip disabled.

Colors are [Flexoki](https://github.com/kepano/flexoki) dark
(background/foreground/accent/inactive only — no red/green/yellow
state colors; battery, network, tray-attention states all render in
neutral or accent color instead).

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
