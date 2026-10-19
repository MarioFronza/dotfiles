if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    # Keep sway's log off the console between Plymouth and the first frame.
    mkdir -p ~/.local/state
    exec sway > ~/.local/state/sway.log 2>&1
fi
