#!/bin/sh

BACKUP_ROOT="$HOME/github/dotfiles/general-config/apps"
FLATPAK_APP_DIR="$HOME/.var/app"

tar -czvf "$BACKUP_ROOT/kdenlive/kdenlive-backup.tar.gz" \
    -C "$FLATPAK_APP_DIR/org.kde.kdenlive" config data

tar -czvf "$BACKUP_ROOT/obs/obs-backup.tar.gz" \
    -C "$FLATPAK_APP_DIR/com.obsproject.Studio/config" obs-studio
