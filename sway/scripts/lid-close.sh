#!/usr/bin/env bash
ext=$(swaymsg -t get_outputs | jq -r '[.[] | select(.name != "eDP-1" and .active)][0].name // empty')
[ -n "$ext" ] && swaymsg output eDP-1 disable
