# alacritty

`alacritty` and `ttf-jetbrains-mono-nerd` (the font) are installed via
[`../packages/`](../packages/README.md).

## Setup

[`alacritty-theme`](https://github.com/alacritty/alacritty-theme) isn't a
package — clone it for the Tokyo Night theme (`themes/tokyo_night.toml`):

```bash
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/alacritty
cp alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```

`alacritty.toml` imports `themes/tokyo_night.toml` from the theme clone
above (not this repo's clone) — same theme (Night variant) as
[`swaylock`](../swaylock/README.md), [`fuzzel`](../fuzzel/README.md),
[`mako`](../mako/README.md), [`swayosd`](../swayosd/README.md),
[`waybar`](../waybar/README.md) and [`nvim`](../nvim/README.md).

## Apply

Restart alacritty, or `Ctrl+Shift+,` if `live_config_reload` is on.
