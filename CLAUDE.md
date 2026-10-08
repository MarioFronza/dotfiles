# dotfiles

User config for Arch, managed by GNU Stow. Consumed by
[dark-sun](https://github.com/MarioFronza/dark-sun), the installer. This file
describes the **target state**; code is mid-migration, and when it disagrees
with this file, this file is the goal.

## Boundary

**dotfiles owns everything under `$HOME`.** dark-sun owns everything else.

- Config files only. No package lists, no `sudo`, no hardware detection, no
  install scripts beyond a thin stow wrapper.
- Packages, GPU drivers, system files (`/etc`, udev, services) and the login
  shell live in dark-sun.
- Only what dark-sun installs lives here. No personal leftovers for other setups.
- One source of truth per file. If a config exists in both repos, it's a bug.

## Layout

Each top-level directory is a stow package mirroring `$HOME`:

```
zsh/       .zshrc .zprofile .inputrc .config/zsh/...
alacritty/ .config/alacritty/...
sway/      .config/sway/...
claude/    .claude/CLAUDE.md .claude/skills/...  (settings.json copied, not linked)
```

- Cloned to `~/dotfiles`. Install: `stow --no-folding -t ~ <package>`.
  `--no-folding` is mandatory: `~/.claude` and `~/.config/*` hold runtime
  state that must not land in the repo.
- Repo-root files (`README.md`, `CLAUDE.md`) sit outside package dirs, so stow
  never sees them.
- Identity and secrets (`~/.config/git/identity`) stay out; ship `*.example`.

## Conventions

- One README at the root. No per-package READMEs.
- Conventional commit prefixes. A change spanning both repos is two commits,
  dotfiles first (dark-sun consumes it).
