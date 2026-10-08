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

tmphome=$(mktemp -d)
stow --no-folding -d "$REPO" -t "$tmphome" claude
if [[ -L "$tmphome/.claude/settings.json" ]]; then
  echo "FAIL: claude/.claude/settings.json must not be a symlink"
  failures=$((failures + 1))
fi
rm -rf "$tmphome"
tmphome=$(mktemp -d)
stow --no-folding -d "$REPO" -t "$tmphome" git
if [[ -L "$tmphome/.config/git/identity.example" ]]; then
  echo "FAIL: git/.config/git/identity.example must not be a symlink"
  failures=$((failures + 1))
fi
rm -rf "$tmphome"

if [[ $failures -gt 0 ]]; then
  exit 1
fi
