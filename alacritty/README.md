# alacritty

`alacritty` and `ttf-jetbrains-mono-nerd` (the font) are installed via
[`../packages/`](../packages/README.md).

## Theme

[`alacritty-theme`](https://github.com/alacritty/alacritty-theme) isn't a
package — clone it for the Tokyo Night theme (`themes/tokyo_night.toml`):

```bash
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

## Copy

No clone of this repo. Create the file, paste content from GitHub:

| File | Target |
|---|---|
| [`alacritty.toml`](https://github.com/MarioFronza/dotfiles/blob/main/alacritty/alacritty.toml) | `~/.config/alacritty/alacritty.toml` |

```bash
mkdir -p ~/.config/alacritty
vim ~/.config/alacritty/alacritty.toml
```

`alacritty.toml` imports `themes/tokyo_night.toml` from the clone above.

## Apply

Restart alacritty, or `Ctrl+Shift+,` if `live_config_reload` is on.
