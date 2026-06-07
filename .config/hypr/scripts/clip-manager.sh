#!/usr/bin/env bash
## /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Clipboard Manager. This script uses cliphist, rofi, and wl-copy.

# Actions:
# CTRL Del to delete an entry
# ALT Del to wipe clipboard contents

while true; do
    result=$(
        rofi -dmenu \
            -p " " \
            -kb-custom-1 "Control-Delete" \
            -kb-custom-2 "Alt-Delete" \
            -theme ~/.config/rofi/themes/clip-material-darker-edges.rasi \
            < <(cliphist list)
    )

    case "$?" in
    1)
        exit
        ;;
    0)
        case "$result" in
        "")
            continue
            ;;
        *)
            cliphist decode <<<"$result" | wl-copy
            notify-send "Clipboard" "Copied to clipboard!"
            exit
            ;;
        esac
        ;;
    10)
        cliphist delete <<<"$result"
        notify-send "Clipboard" "Entry deleted!"
        ;;
    11)
        cliphist wipe
        notify-send "Clipboard" "Clipboard History cleared!"
        ;;
    esac
done
