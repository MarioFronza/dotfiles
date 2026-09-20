# swaylock

Lock screen, driven by [`../sway/scripts/idle-lock.sh`](../sway/scripts/idle-lock.sh)
(`exec`'d from [`../sway/config`](../sway/config)): a single-instance
(flock-guarded) `swayidle` that locks on `before-sleep`, no idle timeout —
suspend (lid close included) always locks; nothing else does. Force a
lock any time via `power` (Lock option, see [`../sway/README.md`](../sway/README.md)).

`swaylock` and `swayidle` aren't installed via [`../packages/`](../packages/README.md)
— archinstall's Sway profile already installs them (see
[`../QUICKSTART.md`](../QUICKSTART.md)).

Colors are [Tokyo Night](https://github.com/folke/tokyonight.nvim) (Night
variant), same as the rest of the setup — `#f7768e` (red) for the
wrong-password ring, otherwise same palette as [`fuzzel`](../fuzzel/README.md).

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/swaylock
cp swaylock/config ~/.config/swaylock/config
```

`idle-lock.sh` is copied along with the rest of [`sway/`](../sway/README.md):

```bash
mkdir -p ~/.config/sway
cp sway/config ~/.config/sway/config
cp -r sway/scripts ~/.config/sway/
```

## Apply

```bash
swaymsg reload
```

`exec` only runs on Sway startup, not on reload — log out/in (or
`swaymsg exit`) to actually launch `idle-lock.sh` after a fresh install.

## Notes

- Test the lock manually any time with `swaylock -f`.
