# zsh

`zshrc` isn't itself linked anywhere — it's copied to `~/.zshrc`, and its
job is just to `source` the real files from `~/.config/zsh/`, in order:
`shell`, `init`, `envs`, `aliases`, `functions`, `prompt`, `inputrc`, then an
optional `secrets` (untracked, local only).

## Install (Arch)

`zsh` and everything it depends on (`zsh-autosuggestions`,
`zsh-syntax-highlighting`, `starship`, `zoxide`, `fzf`, `eza`, `bat`,
`gum`, `mise`, `atuin`) is already in
[`../packages/pacman.txt`](../packages/README.md), covered by
`packages/install.sh`.

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
