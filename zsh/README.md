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

From the root of your clone of this repo:

| File | Target |
| --- | --- |
| `zsh/zshrc` | `~/.zshrc` |
| `zsh/shell` | `~/.config/zsh/shell` |
| `zsh/init` | `~/.config/zsh/init` |
| `zsh/envs` | `~/.config/zsh/envs` |
| `zsh/aliases` | `~/.config/zsh/aliases` |
| `zsh/functions` | `~/.config/zsh/functions` |
| `zsh/prompt` | `~/.config/zsh/prompt` |
| `zsh/bindkeys` | `~/.config/zsh/bindkeys` |
| `zsh/inputrc` | `~/.inputrc` |

```bash
mkdir -p ~/.config/zsh
cp zsh/shell zsh/init zsh/envs zsh/aliases zsh/functions zsh/prompt zsh/bindkeys ~/.config/zsh/
cp zsh/zshrc ~/.zshrc
cp zsh/inputrc ~/.inputrc
```

## Apply

```bash
chsh -s /usr/bin/zsh
reboot   # login shell only applies after logout/reboot
```

Or just `exec zsh` for the current session without making it the login shell.

Optional: `~/.config/zsh/secrets`, sourced if present, never tracked here.
