# fuzzel

Application launcher, bound to `$mod+space` in [`../sway/config`](../sway/config)
(replaces `wmenu-run`, which still ships with archinstall's Sway
profile but isn't used). `fuzzel` itself is installed via
[`../packages/`](../packages/README.md).

Colors are Tokyo Night, matching the palette in
[`../claude/themes/tokyo_night.json`](../claude/themes/tokyo_night.json)
(`#7aa2f7` accent, `#a9b1d6` text, `#1a1b26` background) — same font as
the rest of the setup.

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/fuzzel
cp fuzzel/fuzzel.ini ~/.config/fuzzel/fuzzel.ini
```

## Apply

Takes effect the next time fuzzel is launched — no reload needed.
