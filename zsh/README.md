# zsh

## Install (Arch)

```bash
sudo pacman -S --needed zsh zsh-autosuggestions zsh-syntax-highlighting starship zoxide fzf eza bat gum mise atuin
```

| Package | Used for |
|---|---|
| `zsh` | the shell itself |
| `zsh-autosuggestions` | plugin, sourced from `/usr/share/zsh/plugins/` in `init` |
| `zsh-syntax-highlighting` | plugin, sourced from `/usr/share/zsh/plugins/` in `init` |
| `starship` | prompt, initialized in `init` and configured by `prompt` |
| `zoxide` | frecency-based `cd`, backs the `zd`/`cd` function in `functions` |
| `fzf` | fuzzy finder, backs `ff`/`eff` in `functions` |
| `bat` | file preview inside `ff`/`eff` |
| `gum` | confirmation prompt in the `gd` (remove worktree) function |
| `mise` | tool/language version manager, activated in `init` |
| `atuin` | shell history, bound to `Ctrl+R` in `init` |

Optional, only needed if you actually use the alias/function that calls
them: `tmux` (`t`), `docker` (`sgpt`), `ddcutil` (`monhd`/`mondp` —
DDC-capable external monitor only), `git` (`ga`/`gd`, see
[`../git/README.md`](../git/README.md)).

Set zsh as your login shell, then log out and back in (or reboot) for it
to take effect — `exec zsh` in the current session isn't enough for a
*login* shell change:

```bash
chsh -s /usr/bin/zsh
reboot
```

## Copy

No clone — create each file below by hand and paste in the content from
its GitHub page:

| File | Target |
|---|---|
| [`zshrc`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/zshrc) | `~/.zshrc` |
| [`shell`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/shell) | `~/.config/zsh/shell` |
| [`init`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/init) | `~/.config/zsh/init` |
| [`envs`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/envs) | `~/.config/zsh/envs` |
| [`aliases`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/aliases) | `~/.config/zsh/aliases` |
| [`functions`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/functions) | `~/.config/zsh/functions` |
| [`prompt`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/prompt) | `~/.config/zsh/prompt` |
| [`inputrc`](https://github.com/MarioFronza/dotfiles/blob/main/zsh/inputrc) | `~/.config/zsh/inputrc` **and** `~/.inputrc` |

```bash
mkdir -p ~/.config/zsh
nano ~/.config/zsh/shell   # paste, save (Ctrl+O, Enter, Ctrl+X), repeat per file
```

## Apply

```bash
exec zsh
```

Optional: create `~/.config/zsh/secrets` for machine-local exports (API
keys, etc.) — sourced automatically if present, never tracked in this repo.

`functions`: `zd`/`cd` (zoxide-aware cd), `ff`/`eff` (fzf+bat file picker),
`n` (nvim, defaults to `.`), `ssh` (auto-reconnect + terminal cleanup),
`fip`/`dip`/`lip` (SSH port forwarding), `ga`/`gd` (git worktree
create/remove).

`inputrc` is GNU Readline syntax, not zsh: the `bindkey` lines work when
zsh sources it, but the `set ...` lines are readline-only and no-ops
under zsh. That's why it's also copied straight to `~/.inputrc` — that
copy is what actually applies them, for any readline program (bash,
`python3`'s REPL, etc), independent of zsh.

## Reorg suggestion

Right now `aliases` mixes shell aliases with one-off `git config --global`
calls (see the `git config --global alias.*` lines) — those belong in
[`git/config`](../git/README.md) under `[alias]`, not in a file that only
runs when a zsh shell starts. Worth moving next time you touch either file.
