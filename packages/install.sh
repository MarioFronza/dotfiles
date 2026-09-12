#!/usr/bin/env bash
# Installs the base pacman/AUR package set for a fresh machine.
#
# Usage: ./install.sh [amd|intel|nvidia]
#
# The GPU argument is optional and picks the matching gpu-<vendor>.txt.
# Omit it to skip GPU-specific drivers entirely (mesa/vulkan-icd-loader are
# already in pacman.txt, vendor-agnostic).
set -euo pipefail
cd "$(dirname "$0")"

gpu="${1:-}"
if [[ -n "$gpu" && ! -f "gpu-${gpu}.txt" ]]; then
  echo "Unknown GPU '$gpu'. Expected: amd, intel, or nvidia." >&2
  exit 1
fi

# Strips full-line and inline comments, keeping just the package name per line.
pkgs() {
  sed 's/#.*//' "$1" | awk 'NF{print $1}'
}

echo "==> Updating package databases"
sudo pacman -Sy

echo "==> Installing official repo packages"
mapfile -t official_pkgs < <(pkgs pacman.txt)
sudo pacman -S --needed "${official_pkgs[@]}"

if [[ -n "$gpu" ]]; then
  echo "==> Installing $gpu GPU driver"
  mapfile -t gpu_pkgs < <(pkgs "gpu-${gpu}.txt")
  sudo pacman -S --needed "${gpu_pkgs[@]}"
fi

if ! command -v yay &>/dev/null; then
  echo "==> Bootstrapping yay"
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (cd "$tmpdir/yay" && makepkg -si --noconfirm)
  rm -rf "$tmpdir"
fi

echo "==> Installing AUR packages"
mapfile -t aur_pkgs < <(pkgs aur.txt)
yay -S --needed "${aur_pkgs[@]}"

echo "==> Installing mise tool versions"
mkdir -p ~/.config/mise
cp ../mise/config.toml ~/.config/mise/config.toml
mise install

echo "==> Done"
