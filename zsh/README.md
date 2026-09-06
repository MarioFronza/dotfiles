# zsh

## Install (Arch)

```bash
sudo pacman -S --needed zsh zsh-autosuggestions zsh-syntax-highlighting starship zoxide fzf eza bat gum mise atuin
```

| Package | Used for |
|---|---|
| `zsh` | the shell |
| `zsh-autosuggestions` | plugin (`init`) |
| `zsh-syntax-highlighting` | plugin (`init`) |
| `starship` | prompt |
| `zoxide` | `zd`/`cd` function |
| `fzf` | `ff`/`eff` function |
| `bat` | preview in `ff`/`eff` |
| `gum` | confirm prompt in `gd` |
| `mise` | tool version manager |
| `atuin` | history, `Ctrl+R` |

Optional, per alias: `tmux` (`t`), `docker` (`sgpt`), `ddcutil`
(`monhd`/`mondp`), `git` (`ga`/`gd`, see [`../git/`](../git/README.md)).

```bash
chsh -s /usr/bin/zsh
reboot   # login shell only applies after logout/reboot
```

## Copy

No clone. Create each file, paste content from its GitHub page:

| File | Target |
|---|---|
| [`zshrc`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/zshrc) | `~/.zshrc` |
| [`shell`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/shell) | `~/.config/zsh/shell` |
| [`init`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/init) | `~/.config/zsh/init` |
| [`envs`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/envs) | `~/.config/zsh/envs` |
| [`aliases`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/aliases) | `~/.config/zsh/aliases` |
| [`functions`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/functions) | `~/.config/zsh/functions` |
| [`prompt`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/prompt) | `~/.config/zsh/prompt` |
| [`inputrc`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/inputrc) | `~/.config/zsh/inputrc` and `~/.inputrc` |

```bash
mkdir -p ~/.config/zsh
vim ~/.config/zsh/shell
```

## Apply

```bash
exec zsh
```

Optional: `~/.config/zsh/secrets`, sourced if present, never tracked here.

## Notes

- `inputrc`: readline syntax, not zsh. `bindkey` lines work when zsh
  sources it; `set ...` lines only work via the copy at `~/.inputrc`.
- `aliases` has `git config --global alias.*` lines that belong in
  [`git/config`](../git/README.md) `[alias]` instead — move next touch.
