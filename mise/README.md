# mise

Global tool versions.

## Build deps

Some tools compile from source and need extra packages beyond `base-devel`:

```bash
sudo pacman -S re2c gd   # php
```

## Copy

[`config.toml`](https://github.com/MarioFronza/dotfiles/blob/main/mise/config.toml) → `~/.config/mise/config.toml`

```bash
mkdir -p ~/.config/mise
vim ~/.config/mise/config.toml
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
