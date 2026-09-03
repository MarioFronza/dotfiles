# github (gh CLI)

`hosts.yml` (holds the auth token) is never tracked here — log in fresh on
each machine.

## Install (Arch)

```bash
sudo pacman -S github-cli
```

## Link

```bash
mkdir -p ~/.config/gh
ln -sf "$(pwd)/config.yml" ~/.config/gh/config.yml
```

## Apply

```bash
gh auth login
```
