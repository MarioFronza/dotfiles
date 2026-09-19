#!/usr/bin/env bash
exec 9>"${XDG_RUNTIME_DIR:-/tmp}/idle-lock.sh.lock"
flock -n 9 || exit 0
exec swayidle -w before-sleep 'swaylock -f'
