# fuzzel

Application launcher, bound to `$mod+space` in [`../sway/config`](../sway/config)
(replaces `wmenu-run`, which still ships with archinstall's Sway
profile but isn't used). `fuzzel` itself is installed via
[`../packages/`](../packages/README.md).

Colors are [Flexoki](https://github.com/kepano/flexoki) dark
(`#4385be` accent/blue-400, `#cecdc3` text, `#100f0f` background,
hex values from the project's `css/flexoki.css`) — same font as the
rest of the setup.

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/fuzzel
cp fuzzel/fuzzel.ini ~/.config/fuzzel/fuzzel.ini
```

## Apply

Takes effect the next time fuzzel is launched — no reload needed.
