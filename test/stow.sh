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

assert_not_linked() {
  local pkg="$1" path="$2"
  local tmphome
  tmphome=$(mktemp -d)
  stow --no-folding -d "$REPO" -t "$tmphome" "$pkg"
  if [[ -L "$tmphome/$path" ]]; then
    echo "FAIL: $path must not be a symlink"
    failures=$((failures + 1))
  fi
  rm -rf "$tmphome"
}

assert_not_linked claude  .claude/settings.json
assert_not_linked git     .config/git/identity.example

if [[ $failures -gt 0 ]]; then
  exit 1
fi
