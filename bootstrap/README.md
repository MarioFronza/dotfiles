# bootstrap

Bare minimum to go from a fresh `archinstall` + SSH session to being able
to work through the rest of this repo's per-folder READMEs by hand. Grows
over time — add here whatever turns out to be missing before anything
else can run.

## Install (Arch)

```bash
sudo pacman -Sy --needed git base-devel
```

- `git` — clone this repo
- `base-devel` — needed later to build AUR packages with `yay`

## From here

Clone the repo for real, then install every pacman/AUR package in one
shot — see [`../packages/README.md`](../packages/README.md):

```bash
git clone https://github.com/MarioFronza/dotfiles.git
cd dotfiles/packages
./install.sh [amd|intel|nvidia]
```

## Order

With packages installed, walk each folder's README for its "Copy" step
(config files into place, no more per-folder install). Suggested order:
`alacritty/`, `zsh/`, `tmux/`, `git/`, `github/`, `mise/`, `nvim/`,
`sway/`, `claude/`.
