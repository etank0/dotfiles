#!/bin/sh

EMOJI_TSV="$HOME/.config/rofi/assets/emojis.tsv"

selected=$(awk -F'\t' '{print $1 " : " $2}' "$EMOJI_TSV" | rofi -dmenu \
    -theme ~/.config/rofi/themes/clip-raycast-edges.rasi \
    -i \
    -p "󰞅 " \
    -columns 1 \
    -matching "normal")

[ -z "$selected" ] && exit

emoji=$(echo "$selected" | awk -F' : ' '{print $1}' | xargs)

# Copy to clipboard
echo -n "$emoji" | wl-copy

# Type the emoji
wtype -M ctrl -M shift v -m shift -m ctrl

