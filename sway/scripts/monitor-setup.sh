#!/usr/bin/env bash

apply() {
  local ext width height refresh hz
  read -r ext width height refresh < <(swaymsg -t get_outputs | jq -r '
    [.[] | select(.name != "eDP-1" and .active)][0]
    | select(.)
    | (.modes | sort_by(.width * .height, .refresh) | last) as $best
    | "\(.name) \($best.width) \($best.height) \($best.refresh)"')

  if [ -z "$ext" ]; then
    local focused
    focused=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused) | .name')
    [ "$focused" = "10" ] && swaymsg workspace 1
    return
  fi

  hz=$(printf "%d.%03d" $((refresh / 1000)) $((refresh % 1000)))
  swaymsg output "$ext" mode "${width}x${height}@${hz}Hz"
  swaymsg output "$ext" pos 0 0
  swaymsg output eDP-1 pos "$width" 0
  for i in $(seq 1 9); do swaymsg workspace "$i" output "$ext"; done
  swaymsg workspace 10 output eDP-1
}

apply
swaymsg -t subscribe -m '["output"]' | while read -r _; do apply; done
