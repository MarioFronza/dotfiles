# alacritty

Terminal emulator config. Theme is Flexoki Dark, pulled from the
[alacritty-theme](https://github.com/alacritty/alacritty-theme) collection
(the standard way to install Alacritty themes) — not bundled in this repo.

## Install (Arch)

| Item | Install via | Used for |
|---|---|---|
| `alacritty` | `sudo pacman -S alacritty` | terminal emulator |
| [`alacritty-theme`](https://github.com/alacritty/alacritty-theme) | `git clone` (below) | provides `themes/flexoki.toml`, the Flexoki Dark colorscheme |

```bash
sudo pacman -S alacritty
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

## Copy

No clone of this repo — create the file by hand and paste in the content
from its GitHub page:

| File | Target |
|---|---|
| [`alacritty.toml`](https://github.com/MarioFronza/dotfiles/blob/main/alacritty/alacritty.toml) | `~/.config/alacritty/alacritty.toml` |

```bash
mkdir -p ~/.config/alacritty
nano ~/.config/alacritty/alacritty.toml   # paste, save (Ctrl+O, Enter, Ctrl+X)
```

`alacritty.toml` imports `~/.config/alacritty/themes/themes/flexoki.toml`
from the clone above (Flexoki's dark variant — `flexoki-light.toml` is
the other one in the collection).

## Apply

Restart alacritty (or reload with `Ctrl+Shift+,` if `live_config_reload` is on).
