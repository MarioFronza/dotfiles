#!/usr/bin/env bash
# Whichever monitor isn't the laptop panel (eDP-1) becomes the main work
# surface: workspaces 1-9. eDP-1 always keeps workspace 10, but only while
# docked — without an external monitor, workspace 10 is just a normal
# workspace, and if it's the one focused (e.g. sway restoring the assignment
# from before undocking) we bounce back to workspace 1. Runs once at startup
# and again on every output hotplug, so this works no matter which external
# monitor is plugged in — no per-monitor identifier needed here (see
# sway/config for per-monitor mode/refresh tuning, which does need one).

apply() {
  local ext width
  read -r ext width < <(swaymsg -t get_outputs | jq -r '
    [.[] | select(.name != "eDP-1" and .active)][0]
    | select(.) | "\(.name) \(.current_mode.width)"')

  if [ -z "$ext" ]; then
    local focused
    focused=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused) | .name')
    [ "$focused" = "10" ] && swaymsg workspace 1
    return
  fi

  swaymsg output "$ext" pos 0 0
  swaymsg output eDP-1 pos "$width" 0
  for i in $(seq 1 9); do swaymsg workspace "$i" output "$ext"; done
  swaymsg workspace 10 output eDP-1
}

apply
swaymsg -t subscribe -m '["output"]' | while read -r _; do apply; done
