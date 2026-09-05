# alacritty

Terminal emulator config. Theme is Tokyo Night, loaded from a local file in
`themes/` (no dynamic theme system, no external dependency).

## Install (Arch)

```bash
sudo pacman -S alacritty
```

## Copy

```bash
mkdir -p ~/.config/alacritty/themes
cp alacritty.toml ~/.config/alacritty/alacritty.toml
cp themes/tokyo_night.toml ~/.config/alacritty/themes/tokyo_night.toml
```

## Apply

Restart alacritty (or reload with `Ctrl+Shift+,` if `live_config_reload` is on).
