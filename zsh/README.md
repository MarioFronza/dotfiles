# zsh

## Install (Arch)

```bash
sudo pacman -S --needed zsh zsh-autosuggestions zsh-syntax-highlighting starship zoxide fzf eza bat gum mise atuin
```

Each is loaded conditionally (`command -v` checks in `init`/`functions`),
but this is the full set needed for everything below to actually work:
`zsh-autosuggestions`/`zsh-syntax-highlighting` (plugins sourced from
`/usr/share/zsh/plugins/`), `starship` (prompt), `zoxide`/`fzf`/`bat`
(the `zd`/`ff`/`eff` functions), `gum` (the `gd` worktree-removal
confirmation), `mise`, `atuin` (`Ctrl+R` history search).

Also used by specific aliases/functions, install if you use them: `tmux`
(`t`), `docker` (`sgpt`), `ddcutil` (`monhd`/`mondp` — DDC-capable
external monitor only), `git` (`ga`/`gd`, see
[`../git/README.md`](../git/README.md)).

Set zsh as your login shell:

```bash
chsh -s /usr/bin/zsh
```

## Copy

```bash
mkdir -p ~/.config/zsh
cp zshrc ~/.zshrc
cp shell init envs aliases functions prompt inputrc ~/.config/zsh/
cp inputrc ~/.inputrc
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
