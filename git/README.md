# git

## Install (Arch)

```bash
sudo pacman -S git
```

## Copy

```bash
mkdir -p ~/.config/git
cp config ignore ~/.config/git/
```

## Notes

`config` commit-signs with an SSH key
(`user.signingkey = ~/.ssh/id_ed25519_github.pub`) — generate your own and
update the path, or point it at whichever key you use:

```bash
ssh-keygen -t ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519_github
```

Then add the **public** key to GitHub under both *Authentication* and
*Signing* keys (Settings → SSH and GPG keys).
