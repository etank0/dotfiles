#!/bin/sh

step=1.5
toggle_factor=2.25

factor="$(
    hyprctl getoption cursor:zoom_factor |
    awk 'NR==1 {
        factor = ($2 < 1 ? 1 : $2)
        print factor
    }'
)"

case "$1" in
    zoom-in)
        factor=$(awk "BEGIN { print $factor * $step }")
        ;;

    zoom-out)
        factor=$(awk "BEGIN {
            z = $factor / $step
            print (z < 1 ? 1 : z)
        }")
        ;;

    toggle)
        if awk "BEGIN { exit !($factor > 1.01) }"; then
            factor=1
        else
            factor=$toggle_factor
        fi
        ;;

    *)
        echo "usage: $0 {toggle|zoom-in|zoom-out}" >&2
        exit 1
        ;;
esac

hyprctl keyword cursor:zoom_factor "$factor"
