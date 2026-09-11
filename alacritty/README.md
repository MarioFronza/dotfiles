# alacritty

## Install (Arch)

| Item | Used for |
|---|---|
| `alacritty` | terminal emulator |
| `ttf-jetbrains-mono-nerd` | font (JetBrainsMono Nerd Font) |
| [`alacritty-theme`](https://github.com/alacritty/alacritty-theme) | Tokyo Night (`themes/tokyo_night.toml`) |

```bash
sudo pacman -S alacritty ttf-jetbrains-mono-nerd
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
