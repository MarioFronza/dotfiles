#!/usr/bin/env bash
set -u

LOCK=/tmp/sway-monitor-setup.lock

best_modes() {
  swaymsg -t get_outputs | jq -r --argjson stale_only "${1:-false}" '
    .[]
    | select(.modes != [])
    | (.modes | sort_by(.width * .height, .refresh) | last) as $best
    | select(($stale_only | not) or (.active and (.current_mode | {width, height, refresh}) != ($best | {width, height, refresh})))
    | "\(.name) \($best.width) \($best.height) \($best.refresh)"'
}

hz() { printf "%d.%03d" $(($1 / 1000)) $(($1 % 1000)); }

# Desktops have no built-in panel and no lid, so the only thing to manage is
# each output's mode: sway's EDID preferred one is often 60Hz.
INTERNAL=$(swaymsg -t get_outputs | jq -r '[.[] | select(.name | test("^(eDP|LVDS|DSI)"))][0].name // empty')
if [ -z "$INTERNAL" ]; then
  apply_best_modes() {
    best_modes true | while read -r out width height refresh; do
      swaymsg output "$out" mode "${width}x${height}@$(hz "$refresh")Hz"
    done
  }
  apply_best_modes
  [ "${1:-}" = once ] && exit 0
  swaymsg -t subscribe -m '["output"]' | while read -r _; do apply_best_modes; done
  exit 0
fi

lid_closed() { grep -qw closed /proc/acpi/button/lid/*/state 2>/dev/null; }

internal_active() {
  swaymsg -t get_outputs | jq -r --arg int "$INTERNAL" '.[] | select(.name == $int) | .active'
}

external_best() {
  best_modes | awk -v internal="$INTERNAL" '$1 != internal' | head -n 1
}

layout() {
  local ext width height refresh
  read -r ext width height refresh < <(external_best)

  if [ -z "${ext:-}" ]; then
    # Touch the panel only when it is actually off. A redundant modeset here
    # races idle-lock.sh's before-sleep lock and can resume to a black screen.
    if [ "$(internal_active)" != true ]; then
      swaymsg output "$INTERNAL" enable pos 0 0
    fi
    return
  fi

  swaymsg output "$ext" enable mode "${width}x${height}@$(hz "$refresh")Hz" pos 0 0

  if lid_closed; then
    swaymsg output "$INTERNAL" disable
  else
    swaymsg output "$INTERNAL" enable pos "$width" 0
  fi

  for i in $(seq 1 9); do swaymsg workspace "$i" output "$ext"; done
  swaymsg workspace 10 output "$INTERNAL" "$ext"
}

apply() { ( flock 9; layout ) 9>"$LOCK"; }

# Only physical changes move this: layout() never connects or disconnects an
# output, so its own events can never re-trigger apply. Without the guard,
# applying a layout emits more output events than it consumes and the loop
# feeds itself into a modeset storm that starves every client of frame
# callbacks.
fingerprint() {
  printf '%s|%s\n' \
    "$(swaymsg -t get_outputs | jq -r '[.[].name] | sort | join(",")')" \
    "$(lid_closed && echo closed || echo open)"
}

[ "${1:-}" = once ] && { apply; exit 0; }

apply
last=$(fingerprint)

swaymsg -t subscribe -m '["output"]' | while read -r _; do
  sleep 0.3
  now=$(fingerprint)
  [ "$now" = "$last" ] && continue
  last=$now
  apply
done
