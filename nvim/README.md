# nvim

[LazyVim](https://lazyvim.github.io) config. This whole folder maps 1:1 onto
`~/.config/nvim` (personal overrides in `lua/config/` and `lua/plugins/`,
rest is LazyVim boilerplate).

## Install (Arch)

```bash
sudo pacman -S neovim git ripgrep fd unzip lazygit base-devel
```

A Nerd Font is required for icons (Omarchy already ships one; otherwise
install e.g. `ttf-jetbrains-mono-nerd`).

## Link

```bash
mv ~/.config/nvim ~/.config/nvim.bak   # back up if it exists
ln -sfn "$(pwd)" ~/.config/nvim
```

## Apply

```bash
nvim
```

Plugins install automatically on first launch (lazy.nvim bootstraps
itself). `lazy-lock.json` is machine-generated and gitignored — don't
commit it.
