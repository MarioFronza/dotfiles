# git

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/git
cp git/config git/ignore ~/.config/git/
```

## Notes

`config` commit-signs with an SSH key (`user.signingkey =
~/.ssh/id_ed25519.pub`) — the same key used for GitHub auth, reused for
signing. If yours lives at a different path, update that line. Generate
one if you don't have it yet:

```bash
ssh-keygen -t ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519
```

Then add the **public** key to GitHub under both *Authentication* and
*Signing* keys (Settings → SSH and GPG keys) — they're two separate
entries even for the same key.
