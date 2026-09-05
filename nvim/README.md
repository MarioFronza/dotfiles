# nvim

Just my one personal plugin override for [LazyVim](https://lazyvim.github.io).
Everything else is the stock [LazyVim starter](https://github.com/LazyVim/starter).

## Install (Arch)

```bash
sudo pacman -S neovim git ripgrep fd unzip lazygit base-devel
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

## Copy

```bash
mkdir -p ~/.config/nvim/lua/plugins
cp lua/plugins/navigator.lua ~/.config/nvim/lua/plugins/navigator.lua
```
