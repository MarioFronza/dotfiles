#!/usr/bin/env bash
# Installs every package this machine had via pacman/yay, minus anything
# Omarchy-specific (dropped) or Omarchy-repo-only with no AUR equivalent
# (dropped, see README.md). Review pacman.txt's bootloader/GPU sections
# first — those assume Limine and an AMD GPU.
set -euo pipefail
cd "$(dirname "$0")"

echo "==> Updating package databases"
sudo pacman -Sy

echo "==> Installing official repo packages"
grep -v '^#' pacman.txt | grep -v '^$' | xargs sudo pacman -S --needed

if ! command -v yay &>/dev/null; then
  echo "==> Bootstrapping yay"
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (cd "$tmpdir/yay" && makepkg -si --noconfirm)
  rm -rf "$tmpdir"
fi

echo "==> Installing AUR packages"
grep -v '^#' aur.txt | grep -v '^$' | xargs yay -S --needed

echo "==> Done"
