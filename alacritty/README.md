# alacritty

`alacritty` and `ttf-jetbrains-mono-nerd` (the font) are installed via
[`../packages/`](../packages/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/alacritty
cp alacritty/alacritty.toml alacritty/flexoki.toml ~/.config/alacritty/
```

`alacritty.toml` imports `flexoki.toml`, a Flexoki dark palette
([source](https://github.com/euandeas/omarchy-flexoki-dark-theme)) —
same theme as [`swaylock`](../swaylock/README.md), [`fuzzel`](../fuzzel/README.md),
[`mako`](../mako/README.md), [`swayosd`](../swayosd/README.md) and
[`waybar`](../waybar/README.md).

## Apply

Restart alacritty, or `Ctrl+Shift+,` if `live_config_reload` is on.
