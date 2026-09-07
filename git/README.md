# git

## Copy

| File | Target |
| --- | --- |
| [`config`](https://github.com/MarioFronza/dotfiles/blob/main/git/config) | `~/.config/git/config` |
| [`ignore`](https://github.com/MarioFronza/dotfiles/blob/main/git/ignore) | `~/.config/git/ignore` |

```bash
mkdir -p ~/.config/git
vim ~/.config/git/config
vim ~/.config/git/ignore
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
