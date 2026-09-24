# bootstrap

Bare minimum to go from a fresh `archinstall` + SSH session to being able
to work through the rest of this repo's per-folder READMEs by hand. Grows
over time — add here whatever turns out to be missing before anything
else can run.

## Install (Arch)

```bash
sudo pacman -Sy --needed git base-devel
```

- `git` — clone this repo
- `base-devel` — needed later to build AUR packages with `yay`

## From here

Clone the repo for real, then install every pacman/AUR package in one
shot — see [`../packages/README.md`](../packages/README.md):

```bash
git clone https://github.com/MarioFronza/dotfiles.git
cd dotfiles/packages
./install.sh [amd|intel|nvidia]
```

`iwd`, `systemd-networkd`, `systemd-resolved`, and `bluetooth` are
installed now but not enabled — see
[`../packages/wifi-bluetooth.md`](../packages/wifi-bluetooth.md) before
you lose your only connection to the machine.

## Order

With packages installed, `cd` into the clone and walk each folder's
README for its "Copy" step. There is no per-folder install left, only
`cp` into place, and every module's commands assume you are standing at
the repo root.

The order to walk them in is the module list in
[`../README.md`](../README.md).
