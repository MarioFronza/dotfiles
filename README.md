# Dotfiles

Config for an Arch Linux machine, standalone (no distro layer, no dynamic
theming system — Tokyo Night everywhere, hardcoded).

No symlinks — each folder has its own `README.md` with the Arch packages
it needs and the exact `cp` commands to copy it into place. Plain copies
on purpose: no live sync back to this repo, just a one-time setup for a
new machine.

```
git clone git@github.com:MarioFronza/dotfiles.git
cd dotfiles
packages/install.sh [amd|intel|nvidia]   # pacman + AUR + mise, one shot
```

Then follow the README in whichever folder you need:

- [`packages/`](packages/README.md) — the full pacman/AUR package list
- [`mise/`](mise/README.md) — global language/tool versions
- [`hypr/`](hypr/README.md) — Hyprland window manager (optional, not every machine runs it)
- [`alacritty/`](alacritty/README.md) — terminal emulator (Tokyo Night)
- [`tmux/`](tmux/README.md) — terminal multiplexer
- [`zsh/`](zsh/README.md) — shell
- [`nvim/`](nvim/README.md) — editor (LazyVim, just my navigator override)
- [`git/`](git/README.md) — git config
- [`github/`](github/README.md) — gh CLI config
- [`claude/`](claude/README.md) — Claude Code config (Tokyo Night theme)
