# mise

Global tool versions.

Build deps for tools that compile from source (`re2c`, `gd` for php) are
installed via [`../packages/`](../packages/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/mise
cp mise/config.toml ~/.config/mise/config.toml
```

## Apply

```bash
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
