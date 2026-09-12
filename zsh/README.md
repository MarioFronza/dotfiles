# zsh

`zsh`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `starship`,
`zoxide`, `fzf`, `bat`, `gum`, `mise`, and `atuin` are installed via
[`../packages/`](../packages/README.md).

| Package | Used for |
| --- | --- |
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

## Copy

No clone. Create each file, paste content from its GitHub page:

| File | Target |
| --- | --- |
| [`zshrc`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/zshrc) | `~/.zshrc` |
| [`shell`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/shell) | `~/.config/zsh/shell` |
| [`init`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/init) | `~/.config/zsh/init` |
| [`envs`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/envs) | `~/.config/zsh/envs` |
| [`aliases`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/aliases) | `~/.config/zsh/aliases` |
| [`functions`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/functions) | `~/.config/zsh/functions` |
| [`prompt`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/prompt) | `~/.config/zsh/prompt` |
| [`bindkeys`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/bindkeys) | `~/.config/zsh/bindkeys` |
| [`inputrc`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/inputrc) | `~/.inputrc` |

```bash
mkdir -p ~/.config/zsh
vim ~/.config/zsh/shell
```

## Apply

```bash
chsh -s /usr/bin/zsh
reboot   # login shell only applies after logout/reboot
```

Or just `exec zsh` for the current session without making it the login shell.

Optional: `~/.config/zsh/secrets`, sourced if present, never tracked here.
