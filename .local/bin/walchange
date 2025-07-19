#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="$HOME/Pictures/kabegami/wal" # Update this path to your directory

# Pick a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Set the wallpaper using gsettings
gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER"

