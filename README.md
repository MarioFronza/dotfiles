# Dotfiles

My personal config under `$HOME` for Arch, one GNU Stow package per folder,
each mirroring `$HOME`. Installed by
[dark-sun](https://github.com/MarioFronza/dark-sun), which owns packages,
system files and everything else outside `$HOME`.

## Install by hand

```bash
git clone https://github.com/MarioFronza/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --no-folding -t ~ alacritty claude fuzzel git github mako mise nvim sway swaylock swayosd tmux waybar zsh
cp claude/.claude/settings.json ~/.claude/settings.json
cp git/.config/git/identity.example ~/.config/git/identity   # then fill it in
```

`--no-folding` links files, never whole directories, so runtime state in
`~/.claude` and `~/.config/*` stays out of the repo.

Two files are never linked (see each package's `.stow-local-ignore`):

- `claude/.claude/settings.json`: Claude Code rewrites it on `/model`,
  `/theme` and plugin toggles, so it is copied once instead.
- `git/.config/git/identity.example`: template for `identity`, which holds
  your name, email and signing key and stays untracked.

## Test

```bash
bash test/stow.sh
```
