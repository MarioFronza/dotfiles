# Dotfiles

Config under `$HOME` for my Arch machines (ThinkPad and desktop). Installed
by [dark-sun](https://github.com/MarioFronza/dark-sun), which owns packages,
system files and everything else outside `$HOME`.

| Folder | Lands in |
|---|---|
| `alacritty/` | `~/.config/alacritty/` |
| `claude/` | `~/.claude/` |
| `fuzzel/` | `~/.config/fuzzel/` |
| `git/` | `~/.config/git/` (`identity.example` becomes `identity`, filled by hand) |
| `github/` | `~/.config/gh/` |
| `mako/` | `~/.config/mako/` |
| `mise/` | `~/.config/mise/` |
| `nvim/` | `~/.config/nvim/` |
| `sway/` | `~/.config/sway/` |
| `swaylock/` | `~/.config/swaylock/` |
| `swayosd/` | `~/.config/swayosd/` |
| `tmux/` | `~/.config/tmux/` |
| `waybar/` | `~/.config/waybar/` |
| `zsh/` | `zshrc`, `zprofile`, `inputrc` as `~/.<name>`, the rest in `~/.config/zsh/` |

Moving to GNU Stow: each folder becomes a package mirroring `$HOME`.
