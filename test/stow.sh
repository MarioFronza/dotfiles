#!/usr/bin/env bash
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
PACKAGES=(alacritty claude fuzzel git github mako mise nvim sway swaylock swayosd tmux waybar zsh)

failures=0

for pkg in "${PACKAGES[@]}"; do
  tmphome=$(mktemp -d)
  stow --no-folding -d "$REPO" -t "$tmphome" "$pkg"
  while IFS= read -r entry; do
    echo "FAIL: $pkg -> non-dotted entry: $entry"
    failures=$((failures + 1))
  done < <(find "$tmphome" -maxdepth 1 -mindepth 1 ! -name '.*')
  rm -rf "$tmphome"
done

if [[ $failures -gt 0 ]]; then
  exit 1
fi
