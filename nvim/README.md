# nvim

Just my personal plugin overrides for [LazyVim](https://lazyvim.github.io).
Everything else (`init.lua`, `lua/config/*`, lockfile, etc.) is the stock
LazyVim starter — not tracked here.

## Install (Arch)

```bash
sudo pacman -S neovim git ripgrep fd unzip lazygit base-devel
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

A Nerd Font is required for icons (Omarchy already ships one; otherwise
install e.g. `ttf-jetbrains-mono-nerd`).

## Link

```bash
mkdir -p ~/.config/nvim/lua/plugins
for f in lua/plugins/*.lua; do
  ln -sf "$(pwd)/$f" ~/.config/nvim/"$f"
done
```

## Apply

```bash
nvim
```

Note: `~/.config/nvim/lua/config/options.lua` (loading
`~/.config/nvim/lua/config/remote_clipboard.lua`, OSC 52 clipboard over
tmux/SSH) comes from Omarchy's own Neovim setup guide, not from this repo —
re-add it manually from Omarchy's docs if you want it.
