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

## Not here on purpose

`laravel`, `symfony`, `phoenix` aren't mise tools — they're project
generators on top of `php` and `elixir` (already listed). Once those are
installed:

```bash
composer global require laravel/installer   # laravel
composer global require symfony/cli         # symfony
mix archive.install hex phx_new             # phoenix
```
