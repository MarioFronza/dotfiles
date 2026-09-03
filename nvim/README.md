# nvim

Just my one personal plugin override for [LazyVim](https://lazyvim.github.io)
(everything else comes from Omarchy's own Neovim setup).

## Install (Arch)

```bash
sudo pacman -S neovim git ripgrep fd unzip lazygit base-devel
```

## Link

```bash
mkdir -p ~/.config/nvim/lua/plugins
ln -sf "$(pwd)/lua/plugins/navigator.lua" ~/.config/nvim/lua/plugins/navigator.lua
```
