#!/usr/bin/env bash
A_1080=230
B_1080=230

# Check if wlogout is already running
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

# Detect monitor resolution and scaling factor
resolution=$(
  hyprctl -j monitors | jq -r \
    '.[] | select(.focused==true) | .height / .scale' |
  awk -F'.' '{print $1}'
)
hypr_scale=$(
  hyprctl -j monitors | jq -r \
    '.[] | select(.focused==true) | .scale'
)

# Horizontal layout
# wlogout \
#   -C $HOME/.config/wlogout/material-darker-horizontal.css \
#   -l $HOME/.config/wlogout/layout \
#   --protocol layer-shell -b 5 \
#   -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}") \
#   -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") &

# Vertical layout
wlogout \
  -C $HOME/.config/wlogout/material-darker-vertical.css \
  -l $HOME/.config/wlogout/layout \
  --protocol layer-shell -b 1 \
  -T $(awk "BEGIN {printf \"%.0f\", $A_1080 * 1080 * $hypr_scale / $resolution}") \
  -B $(awk "BEGIN {printf \"%.0f\", $B_1080 * 1080 * $hypr_scale / $resolution}") &
