# Dotfiles

My personal config under `$HOME`, one GNU Stow package per folder, each
mirroring `$HOME`. Not tied to one OS: it can hold config for macOS or other
Linux systems too. On Arch it is installed by
[arch-linux-setup](https://github.com/MarioFronza/arch-linux-setup), which owns packages,
system files and everything else outside `$HOME`.

## Install by hand

```bash
git clone https://github.com/MarioFronza/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --no-folding -t ~ alacritty btop claude fuzzel git github gtk mako mise nvim sway swaylock swayosd tmux waybar zsh
cp claude/.claude/settings.json ~/.claude/settings.json
cp btop/.config/btop/btop.conf ~/.config/btop/btop.conf
cp git/.config/git/identity.example ~/.config/git/identity   # then fill it in
```

`--no-folding` links files, never whole directories, so runtime state in
`~/.claude` and `~/.config/*` stays out of the repo.

Three files are never linked (see each package's `.stow-local-ignore`):

- `claude/.claude/settings.json`: Claude Code rewrites it on `/model`,
  `/theme` and plugin toggles, so it is copied once instead.
- `btop/.config/btop/btop.conf`: btop rewrites it on exit, so it is copied
  once too.
- `git/.config/git/identity.example`: template for `identity`, which holds
  your name, email and signing key and stays untracked.

## Wallpaper

The repo ships one default wallpaper. To use another one on a single
machine, without touching the repo, write a local override:

```bash
mkdir -p ~/.config/sway/config.d
echo 'output * bg ~/Pictures/wallpapers/wallpaper.jpg fill' > ~/.config/sway/config.d/wallpaper
swaymsg reload
```

The sway config includes `~/.config/sway/config.d/*` right after the
default, and stow never touches that folder, so each machine keeps its own.
Delete the file to go back to the default.

## Test

```bash
bash test/stow.sh
```
