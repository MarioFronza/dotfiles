# zsh

`zshrc` sources these files in order: `shell`, `init`, `envs`, `aliases`,
`prompt`, `inputrc`, then an optional `secrets` (untracked, local only), then
Omarchy's default bash aliases/functions/envs.

## Install (Arch)

```bash
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting starship zoxide fzf

# mise (runtime version manager)
curl https://mise.run | sh

# atuin (shell history)
yay -S atuin
```

Set zsh as your login shell:

```bash
chsh -s /usr/bin/zsh
```

## Link

```bash
mkdir -p ~/.config/zsh
ln -sf "$(pwd)/zshrc" ~/.zshrc
for f in shell init envs aliases prompt inputrc; do
  ln -sf "$(pwd)/$f" ~/.config/zsh/"$f"
done
```

## Apply

```bash
exec zsh
```

Optional: create `~/.config/zsh/secrets` for machine-local exports (API
keys, etc.) — sourced automatically if present, never tracked in this repo.
