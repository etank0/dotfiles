#!/bin/sh

DEVICE="Lenovo 5 2022 Ideapad"
TIMEOUT=60 # seconds of keyboard inactivity

openrgb -d "$DEVICE" -c 00050A
backlight_off=0

# A function to turn the backlight on, if it's off.
turn_on() {
    if [[ $backlight_off -eq 1 ]]; then
        echo "Keyboard activity detected. Turning backlight on."
        openrgb -d "$DEVICE" -c 00050A
        backlight_off=0
    fi
}

# A function to turn the backlight off, if it's on.
turn_off() {
    if [[ $backlight_off -eq 0 ]]; then
        echo "Inactivity timeout reached. Turning backlight off."
        openrgb -d "$DEVICE" -c 000000
        backlight_off=1
    fi
}

# Initialize last activity time
last_key_time=$(date +%s)

# This is the main, unified event loop.
# It reads from the `libinput` command's output.
libinput debug-events 2>/dev/null | grep --line-buffered "KEYBOARD_KEY" | while true; do
    # Try to read a line of input, but time out after 1 second.
    if read -r -t 1 line; then
        # If read succeeds (a key was pressed):
        # 1. Update the timestamp.
        # 2. Turn the backlight on (if it was off).
        last_key_time=$(date +%s)
        turn_on
    else
        # If read times out (no key pressed for 1 second):
        # 1. Check if the main TIMEOUT has been exceeded.
        # 2. Turn the backlight off (if it was on).
        now=$(date +%s)
        diff=$((now - last_key_time))
        if [[ $diff -ge $TIMEOUT ]]; then
            turn_off
        fi
    fi
done
