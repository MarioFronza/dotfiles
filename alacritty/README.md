# alacritty

Terminal emulator config. Theme is Flexoki Dark, loaded from a local file
in `themes/` (no dynamic theme system, no external dependency).

## Install (Arch)

```bash
sudo pacman -S alacritty
```

## Copy

```bash
mkdir -p ~/.config/alacritty/themes
cp alacritty.toml ~/.config/alacritty/alacritty.toml
cp themes/flexoki_dark.toml ~/.config/alacritty/themes/flexoki_dark.toml
```

## Apply

Restart alacritty (or reload with `Ctrl+Shift+,` if `live_config_reload` is on).
