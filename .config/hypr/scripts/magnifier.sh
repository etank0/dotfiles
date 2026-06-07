#!/bin/sh

ACTIVE_WIN="$(
  hyprctl activewindow -j |
  awk -F'"' '/"address":/ {print $4; exit}'
)"

hyprctl dispatch focuswindow "title:^$"

step=1.5

factor="$(
    hyprctl getoption cursor:zoom_factor |
    awk 'NR==1 {
        factor = ($2 < 1 ? 1 : $2)
        print factor
    }'
)"

case "$1" in
    wheel-down)
        factor=$(awk "BEGIN { print $factor * $step }")
        ;;
    wheel-up)
        factor=$(awk "BEGIN { print $factor / $step }")
        ;;
    *)
        echo "usage: $0 {wheel-down|wheel-up}" >&2
        [ -n "$ACTIVE_WIN" ] &&
          hyprctl dispatch focuswindow "address:$ACTIVE_WIN"
        exit 1
        ;;
esac

hyprctl keyword cursor:zoom_factor "$factor"

if [ -n "$ACTIVE_WIN" ]; then
    hyprctl dispatch focuswindow "address:$ACTIVE_WIN"
fi
