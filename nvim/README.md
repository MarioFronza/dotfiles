# nvim

My personal plugin overrides for [LazyVim](https://lazyvim.github.io).
Everything else is the stock [LazyVim starter](https://github.com/LazyVim/starter).

Colorscheme is `tokyonight-night`, same shade as [`alacritty`](../alacritty/README.md).

`neovim`, `ripgrep`, `fd`, `unzip`, and `lazygit` are installed via
[`../packages/`](../packages/README.md).

## Setup

[LazyVim starter](https://github.com/LazyVim/starter) isn't a package —
clone it:

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/nvim/lua/plugins
cp nvim/lua/plugins/*.lua ~/.config/nvim/lua/plugins/
```

## Apply

Open `nvim` — LazyVim syncs plugins automatically on first launch.
