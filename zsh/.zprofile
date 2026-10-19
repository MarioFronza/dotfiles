if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    mkdir -p ~/.local/state
    exec sway > ~/.local/state/sway.log 2>&1
fi
