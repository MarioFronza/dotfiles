# Usage

How to drive this setup day to day. Only what is custom; sway and tmux
defaults are left to their man pages.

## Keys

`Super` is the mod key. `h j k l` and the arrow keys work interchangeably.

| Key | Does |
|---|---|
| `Super+Enter` | Terminal (alacritty) |
| `Super+Space` | App launcher (fuzzel) |
| `Super+Shift+q` | Close window |
| `Super+Escape` | Power menu |
| `Super+Shift+t` | Screenshot menu |
| `Super+Shift+p` | CPU power profile menu |
| `Super+Shift+w` | Wi-Fi (impala) |
| `Super+Shift+b` | Bluetooth (bluetui) |
| `Super+Shift+a` | Audio (wiremix) |
| `Super+Shift+c` | Reload sway |
| `Super+Shift+e` | Exit sway |

Windows and workspaces follow sway's defaults: `Super+h/j/k/l` focus,
`Super+Shift+h/j/k/l` move, `Super+1..0` switch workspace,
`Super+Shift+1..0` send the window there, `Super+f` fullscreen,
`Super+Shift+Space` float, `Super+r` resize mode (`Esc` to leave),
`Super+minus` scratchpad.

Media, volume and brightness keys work, even on the lock screen. The
screen locks before suspend.

## Menus

Each menu opens in a terminal; pick with arrows and `Enter`, `Esc` cancels.
They are zsh functions, so they run from a shell too.

- `shot`: `Region` (drag a box) or `Screen`. Opens satty to annotate; save
  with `Ctrl+s` to `~/Pictures/screenshots`, copy with `Ctrl+c`.
- `perf`: switch the CPU power profile (the list depends on the hardware).
- `power`: Lock, Suspend, Reboot, Poweroff.

## Shell

| Command | Does |
|---|---|
| `cd <name>` | Jumps with zoxide when `<name>` is not a directory here |
| `n [file]` | nvim, current directory when no file |
| `ff` / `eff` | Fuzzy find a file / open it in `$EDITOR` |
| `t` | Attach to the `Work` tmux session, creating it if needed |
| `ga <branch>` / `gd` | Create a git worktree next to the repo / remove it and its branch |
| `fip <host> <port>...` / `dip` / `lip` | Forward ports from a host over SSH / stop / list |
| `compress <dir>` / `decompress <file>` | tar.gz in and out |
| `ls`, `lt` | eza listing and tree; `lsa`, `lta` include hidden files |
| `wifi`, `bt`, `audio` | Same TUIs as the sway keys |

Up and Down search history by what is already typed. `ssh` reconnects on
its own when an interactive session drops.

## Tmux

Prefix is `Ctrl+a`.

| Key | Does |
|---|---|
| `Alt+Enter` / `Alt+Shift+Enter` | Split below / right, no prefix |
| `Alt+Escape` | Close pane, no prefix |
| prefix `-` / `\|` | Split below / right |
| prefix `x` / `m` | Close pane / zoom it |
| prefix `H J K L` | Resize pane |
| prefix `c` / `k` | New window / close it |
| prefix `C` / `K` | New session / close it |
| prefix `P` / `N` | Previous / next session |
| prefix `r` | Reload config |

Copy mode is vi: `v` starts a selection, `y` copies it. The mouse works.

## Where to change things

| What | File |
|---|---|
| Keys, startup apps | `sway/.config/sway/config` |
| One machine only (wallpaper, monitors) | `~/.config/sway/config.d/` (see README) |
| Menus and shell functions | `zsh/.config/zsh/functions` |
| Aliases | `zsh/.config/zsh/aliases` |
| Tmux | `tmux/.config/tmux/tmux.conf` |
| Bar | `waybar/.config/waybar/` |
