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

## Clone

No SSH key exists yet at this point (that's set up in
[`../git/README.md`](../git/README.md)), so clone over HTTPS first:

```bash
git clone https://github.com/MarioFronza/dotfiles.git
cd dotfiles
```

Switch the remote to SSH later once a signing/auth key is set up:

```bash
git remote set-url origin git@github.com:MarioFronza/dotfiles.git
```

From here, work through each folder's own README, one at a time.
