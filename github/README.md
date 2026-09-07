# github (gh CLI)

`hosts.yml` (holds the auth token) is never tracked here — log in fresh on
each machine.

## Install (Arch)

```bash
sudo pacman -S github-cli
```

## Copy

[`config.yml`](https://github.com/MarioFronza/dotfiles/blob/main/github/config.yml) → `~/.config/gh/config.yml`

```bash
mkdir -p ~/.config/gh
vim ~/.config/gh/config.yml
```

## Apply

```bash
gh auth login
```
