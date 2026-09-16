#!/usr/bin/env bash
# TUI to pick the active power-profiles-daemon profile. The waybar icon
# (custom/power-profile) is read-only by design — this is the only way
# to change it.

current=$(busctl --system --json=short get-property net.hadess.PowerProfiles \
  /net/hadess/PowerProfiles net.hadess.PowerProfiles ActiveProfile | jq -r .data)

profiles=$(busctl --system --json=short get-property net.hadess.PowerProfiles \
  /net/hadess/PowerProfiles net.hadess.PowerProfiles Profiles \
  | jq -r '.data[].Profile.data')

chosen=$(echo "$profiles" | gum choose --header "Power profile (current: $current)")
[ -z "$chosen" ] && exit 0

busctl --system set-property net.hadess.PowerProfiles /net/hadess/PowerProfiles \
  net.hadess.PowerProfiles ActiveProfile s "$chosen"
