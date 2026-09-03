# alacritty

Terminal emulator config. Theme colors come from Omarchy's active theme via
`general.import`, so this expects an [Omarchy](https://omarchy.org) system.

## Install (Arch)

```bash
sudo pacman -S alacritty
```

## Link

```bash
mkdir -p ~/.config/alacritty
ln -sf "$(pwd)/alacritty.toml" ~/.config/alacritty/alacritty.toml
```

## Apply

```bash
omarchy restart terminal
```

Without Omarchy, drop the `general.import` line at the top of
`alacritty.toml` first — it points at
`~/.local/state/omarchy/current/theme/alacritty.toml`.
