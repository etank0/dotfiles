#!/bin/sh

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/kabegami/wal" # Update this path to your directory

# Pick a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Set the user/wallpaper using hyprpaper/hyprctl
cp /var/lib/AccountsService/icons/$USER ~/.cache/hyprlock-profile.png
cp $WALLPAPER ~/.cache/hyprpaper-wal.png

sleep 1
hyprctl hyprpaper preload $WALLPAPER
hyprctl hyprpaper wallpaper ",${WALLPAPER}"

