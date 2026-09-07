# nvim

Just my one personal plugin override for [LazyVim](https://lazyvim.github.io).
Everything else is the stock [LazyVim starter](https://github.com/LazyVim/starter).

## Install (Arch)

```bash
sudo pacman -S neovim ripgrep fd unzip lazygit
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

## Copy

[`navigator.lua`](https://github.com/MarioFronza/dotfiles/blob/main/nvim/lua/plugins/navigator.lua) → `~/.config/nvim/lua/plugins/navigator.lua`

```bash
mkdir -p ~/.config/nvim/lua/plugins
vim ~/.config/nvim/lua/plugins/navigator.lua
```
