#!/usr/bin/env bash
# Installs the base pacman/AUR package set for a fresh machine.
#
# Usage: ./install.sh [amd|intel|nvidia]
#
# The GPU argument is optional and picks the matching gpu-<vendor>.txt.
# Omit it to skip GPU-specific drivers entirely (mesa/vulkan-icd-loader are
# already in pacman.txt, vendor-agnostic).
#
# Hyprland packages (pacman-hyprland.txt, aur-hyprland.txt) are NOT
# installed by this script — they're for a different compositor setup, see
# hypr/README.md. Install them separately if you need them.
set -euo pipefail
cd "$(dirname "$0")"

gpu="${1:-}"
if [[ -n "$gpu" && ! -f "gpu-${gpu}.txt" ]]; then
  echo "Unknown GPU '$gpu'. Expected: amd, intel, or nvidia." >&2
  exit 1
fi

echo "==> Updating package databases"
sudo pacman -Sy

echo "==> Installing official repo packages"
grep -v '^#' pacman.txt | grep -v '^$' | xargs sudo pacman -S --needed

if [[ -n "$gpu" ]]; then
  echo "==> Installing $gpu GPU driver"
  grep -v '^#' "gpu-${gpu}.txt" | grep -v '^$' | xargs sudo pacman -S --needed
fi

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
