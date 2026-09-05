# packages

Every pacman/AUR package this machine had installed, mapped for a fresh
Arch + Hyprland install (no Omarchy).

```bash
cd packages
./install.sh
```

Review the bootloader and GPU sections in `pacman.txt` first — they assume
Limine and an AMD GPU; adjust for your new machine's hardware.

## What got dropped, and why

**Omarchy's own apps/branding** (no reason to want these without Omarchy):
`omarchy`, `omarchy-keyring`, `omarchy-nvim`, `omarchy-settings`, `omacalc`,
`omacut`, `omawrite`, `aether` (wallpaper-based dynamic theming — moot now
that everything's hardcoded to Tokyo Night), `hyprshade`, `yay` isn't
listed as a target either, since `install.sh` bootstraps it itself if
missing.

**On Omarchy's own repo, not AUR or official — no equivalent found**:
`asdcontrol` (Apple Studio Display brightness — only matters if you have
one), `tobi-try`, `ttfx`. Small niche tools; get them from their GitHub
releases directly if you want them.

**Everything else that was Omarchy-repo-only** (`1password`,
`1password-cli`, `spotify`, `typora`, `nordvpn-bin`, `localsend`, `herdr`,
`cliamp`, `tensaku`, `ttf-ia-writer`, `ufw-docker`, `xdg-terminal-exec`,
`tzupdate`, `yaru-icon-theme`, `limine-mkinitcpio-hook`,
`limine-snapper-sync`, `hyprland-preview-share-picker`) has a real AUR
package under the same or a close name (checked against the AUR API, not
guessed) — they're in `aur.txt`. `mise-bin` and
`ttf-jetbrains-mono-nerd-basic` got swapped for the plain `mise` and
`ttf-jetbrains-mono-nerd` packages, both now in the official repos.

**`quickshell`**: dropped. It was only there as the framework behind
Omarchy's status bar / launcher shell, and the [`hypr/`](../hypr/README.md)
rewrite doesn't use it — there's currently no status bar in the standalone
setup at all (Hyprland + wofi + mako + wlogout, no bar). Add `waybar` (or
quickshell again, and build a config for it) if you want one back.
