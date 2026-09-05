# mise

Global tool versions. Already installed by `packages/install.sh` (mise
itself is in `pacman.txt`); this just copies the manifest and installs
what it lists.

## Copy

```bash
mkdir -p ~/.config/mise
cp config.toml ~/.config/mise/config.toml
mise install
```
