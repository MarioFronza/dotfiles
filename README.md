# Dotfiles

Arch Linux, standalone. No symlinks — copy files into place, per folder's
own `README.md`.

Starting from a blank machine? See [`QUICKSTART.md`](QUICKSTART.md)
(install media through a working, SSH-reachable base system).

```
git clone git@github.com:MarioFronza/dotfiles.git
cd dotfiles
packages/install.sh [amd|intel|nvidia]
```

- [`bootstrap/`](bootstrap/README.md) — bare minimum to clone this repo on a fresh install
- [`packages/`](packages/README.md) — pacman/AUR packages
- [`mise/`](mise/README.md) — language/tool versions
- [`sway/`](sway/README.md) — Sway
- [`alacritty/`](alacritty/README.md) — terminal
- [`tmux/`](tmux/README.md) — terminal multiplexer
- [`zsh/`](zsh/README.md) — shell
- [`nvim/`](nvim/README.md) — editor
- [`git/`](git/README.md) — git config
- [`github/`](github/README.md) — gh CLI config
- [`claude/`](claude/README.md) — Claude Code config
