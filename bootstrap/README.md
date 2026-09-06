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

No clone yet — browse [the repo on GitHub](https://github.com/MarioFronza/dotfiles),
open each folder's README, and copy its commands by hand: install (Arch),
then copy the config into place. No scripts.

## Order

Suggested order after this one: `alacritty/`, `zsh/`, `tmux/`, `git/`,
`github/`, `mise/`, `nvim/`, `sway/` (+ `fuzzel/` + `plymouth/`), `claude/`.
