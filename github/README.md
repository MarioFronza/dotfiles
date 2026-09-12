# github (gh CLI)

`hosts.yml` (holds the auth token) is never tracked here — log in fresh on
each machine.

`github-cli` is installed via [`../packages/`](../packages/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/gh
cp github/config.yml ~/.config/gh/config.yml
```

## Apply

```bash
gh auth login
```
