# alacritty

Terminal emulator config. Theme is Flexoki Dark, pulled from the
[alacritty-theme](https://github.com/alacritty/alacritty-theme) collection
(the standard way to install Alacritty themes) — not bundled in this repo.

## Install (Arch)

```bash
sudo pacman -S alacritty
```

Clone the theme collection into Alacritty's config dir:

```bash
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

## Copy

```bash
cp alacritty.toml ~/.config/alacritty/alacritty.toml
```

`alacritty.toml` imports `~/.config/alacritty/themes/themes/flexoki.toml`
from that clone (Flexoki's dark variant — `flexoki-light.toml` is the
other one in the collection).

## Apply

Restart alacritty (or reload with `Ctrl+Shift+,` if `live_config_reload` is on).
