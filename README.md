# Dotfiles

Arch Linux, standalone. No symlinks — copy files into place, per folder's
own `README.md`.

Starting from a blank machine? See [`QUICKSTART.md`](QUICKSTART.md)
(install media through a working, SSH-reachable base system).

```
git clone https://github.com/MarioFronza/dotfiles.git
cd dotfiles
packages/install.sh [amd|intel|nvidia]
```

Suggested order (also in [`bootstrap/README.md`](bootstrap/README.md)):

- [`bootstrap/`](bootstrap/README.md) — bare minimum to clone this repo on a fresh install
- [`packages/`](packages/README.md) — pacman/AUR packages
- [`alacritty/`](alacritty/README.md) — terminal
- [`zsh/`](zsh/README.md) — shell
- [`tmux/`](tmux/README.md) — terminal multiplexer
- [`git/`](git/README.md) — git config
- [`github/`](github/README.md) — gh CLI config
- [`mise/`](mise/README.md) — language/tool versions
- [`nvim/`](nvim/README.md) — editor
- [`sway/`](sway/README.md) — Sway (includes waybar)
- [`swaylock/`](swaylock/README.md) — lock screen
- [`hypr/`](hypr/README.md) — personal Hyprland overrides (Omarchy-dependent, not standalone)
- [`claude/`](claude/README.md) — Claude Code config
