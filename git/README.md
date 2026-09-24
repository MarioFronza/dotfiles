# git

Config lives in `~/.config/git/`, never `~/.gitconfig`. Git reads both and
`~/.gitconfig` wins, so leaving it absent keeps this module as the only
source of truth. `ignore` is the global exclude file, read from that same
directory by default.

## Copy

```bash
mkdir -p ~/.config/git
cp git/config git/ignore git/allowed_signers ~/.config/git/
```

## Notes

- Commits and tags are signed with the SSH key at `~/.ssh/id_ed25519.pub`,
  the same one used for GitHub auth. Generate it with `ssh-keygen -t
  ed25519 -C "you@example.com" -f ~/.ssh/id_ed25519`, then add the
  **public** key to GitHub under both *Authentication* and *Signing* keys
  — two separate entries for the same key.
- `allowed_signers` is what makes `git verify-commit` and `%G?` work
  locally. SSH signing has no keyring, so git will not verify a signature
  at all until an email is mapped to a public key here. Replace the line
  with your own key to check signatures on your own machine; GitHub's
  Verified badge does not depend on it.
- `merge.ff = only` refuses anything but a fast-forward, so a diverged
  branch has to be rebased (`pull.rebase` already does that on pull).
