# fuzzel

Application launcher, Flexoki Dark themed. Used as `$menu` in
[`../sway/config`](../sway/README.md) (not `wofi` — Sway's config only
calls `fuzzel`, `wofi` is a Hyprland-side thing in `../hypr/`).

## Install (Arch)

In [`../packages/pacman-sway.txt`](../packages/README.md), not
`pacman.txt` (which only has `wofi`, for Hyprland):

```bash
grep -v '^#' ../packages/pacman-sway.txt | xargs sudo pacman -S --needed
```

## Copy

```bash
mkdir -p ~/.config/fuzzel
cp fuzzel.ini ~/.config/fuzzel/fuzzel.ini
```

## Apply

No daemon to reload — fuzzel reads the config fresh every time it's
launched.
