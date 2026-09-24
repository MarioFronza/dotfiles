# nvim

My plugin overrides for [LazyVim](https://lazyvim.github.io), plus the
list of LazyVim extras this machine has enabled. Everything else is the
stock [LazyVim starter](https://github.com/LazyVim/starter).

- `lua/plugins/colorscheme.lua` — [Tokyo Night](https://github.com/folke/tokyonight.nvim)
  (Night variant), same theme as [`alacritty`](../alacritty/README.md),
  [`swaylock`](../swaylock/README.md), [`fuzzel`](../fuzzel/README.md),
  [`mako`](../mako/README.md), [`swayosd`](../swayosd/README.md) and
  [`waybar`](../waybar/README.md)
- `lua/plugins/navigator.lua` — `vim-tmux-navigator`, so `Ctrl+hjkl`
  crosses between vim splits and [`tmux`](../tmux/README.md) panes
- `lazyvim.json` — enabled extras: docker, java, json, kotlin, markdown,
  toml

`neovim`, `ripgrep`, `fd`, `unzip`, and `lazygit` are installed via
[`../packages/`](../packages/README.md).

## Setup

The starter isn't a package — clone it:

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

## Copy

```bash
cp nvim/lazyvim.json ~/.config/nvim/lazyvim.json
cp nvim/lua/plugins/*.lua ~/.config/nvim/lua/plugins/
```

## Apply

Open `nvim` — LazyVim syncs plugins automatically on first launch.

## Notes

- Without `lazyvim.json` the extras are off, so java, kotlin and docker
  come up with no LSP at all. LazyVim rewrites that file itself, both from
  `:LazyExtras` and on its own upgrades, so mirror it back here after
  changing extras.
- `lazy-lock.json` is deliberately untracked: plugins follow upstream
  instead of a pinned set, which means two machines set up on different
  days do not get the same plugin versions.
