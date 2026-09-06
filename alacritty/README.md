# alacritty

## Install (Arch)

| Item | Used for |
|---|---|
| `alacritty` | terminal emulator |
| [`alacritty-theme`](https://github.com/alacritty/alacritty-theme) | Flexoki Dark (`themes/flexoki.toml`) |

```bash
sudo pacman -S alacritty
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

`alacritty.toml` imports `themes/flexoki.toml` from the clone above.

## Apply

Restart alacritty, or `Ctrl+Shift+,` if `live_config_reload` is on.
