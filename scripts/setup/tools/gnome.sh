#!/bin/bash

set -euo pipefail

BASE_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
PACKAGES_FILE="${BASE_DIR}/scripts/setup/packages/gnome.txt"
PACKAGE_TYPE="${PACKAGE_TYPE:-fedora}"

# Install gnome-shell-extensions utility
if ! command -v gnome-extensions &>/dev/null; then
    case "$PACKAGE_TYPE" in
        arch)
            sudo pacman -S --noconfirm \
                gnome-shell-extensions
            ;;
        debian)
            sudo apt install -y \
                gnome-shell-extensions
            ;;
        fedora)
            sudo dnf install -y gnome-extensions
            ;;
        *)
            echo "[gnome] Unknown type: $PACKAGE_TYPE"
            exit 1
            ;;
    esac
fi

EXT_DIR="$HOME/.local/share/gnome-shell/extensions"
mkdir -p "$EXT_DIR"

# Install extensions from package list
while IFS= read -r ext; do
    [[ -z "$ext" ]] && continue
    echo "[gnome] Processing: $ext"
    if ! gnome-extensions list | grep -q "$ext"; then
        echo "[gnome] Trying remote install..."
        busctl --user call \
            org.gnome.Shell.Extensions \
            /org/gnome/Shell/Extensions \
            org.gnome.Shell.Extensions \
            InstallRemoteExtension s "$ext"
    fi
done < "$PACKAGES_FILE"

# Restore dconf settings
DCONF_DIR="general-config/gnome-settings"
BACKUP_PATH="$BASE_DIR/$DCONF_DIR"
BACKUP_PATH+="/dconf-full-backup.txt"
if [[ -f "$BACKUP_PATH" ]]; then
    echo "[gnome] Restoring dconf settings..."
    sudo dconf load / < "$BACKUP_PATH"
else
    echo "[gnome] dconf backup not found:"
    echo "  $BACKUP_PATH"
fi

echo "[gnome] Extensions installed."
