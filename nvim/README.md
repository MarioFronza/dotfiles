# nvim

My personal plugin overrides for [LazyVim](https://lazyvim.github.io).
Everything else is the stock [LazyVim starter](https://github.com/LazyVim/starter).

Colorscheme is [Flexoki](https://github.com/kepano/flexoki-neovim) dark,
same theme as [`alacritty`](../alacritty/README.md), [`swaylock`](../swaylock/README.md),
[`fuzzel`](../fuzzel/README.md), [`mako`](../mako/README.md),
[`swayosd`](../swayosd/README.md) and [`waybar`](../waybar/README.md).
Still missing highlight support for `snacks.nvim` upstream — the
sidebar/picker background comes out a slightly different shade than the
editor.

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
