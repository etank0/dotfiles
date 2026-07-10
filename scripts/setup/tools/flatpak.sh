#!/bin/bash

set -euo pipefail

BASE_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
PACKAGES_FILE="${BASE_DIR}/scripts/setup/packages/flatpak.txt"
DISTRO="${DISTRO:-fedora}"

# Ensure flatpak is installed
if ! command -v flatpak &>/dev/null; then
    echo "[flatpak] Flatpak not found. Installing..."
    case "$DISTRO" in
        arch)   sudo pacman -S --noconfirm flatpak ;;
        debian) sudo apt install -y flatpak ;;
        fedora) sudo dnf install -y flatpak ;;
        *)
            echo "[flatpak] Unknown distro: $DISTRO"
            exit 1
            ;;
    esac
else
    echo "[flatpak] Flatpak is already installed."
fi

# Ensure Flathub is configured
if ! flatpak remotes | grep -q flathub; then
    echo "[flatpak] Adding Flathub remote..."
    flatpak remote-add --if-not-exists flathub \
        https://flathub.org/repo/flathub.flatpakrepo
else
    echo "[flatpak] Flathub is already configured."
fi

# Apply icon theme overrides
echo "[flatpak] Applying icon theme overrides..."
flatpak --user override \
    --filesystem="/home/$USER/.icons/:ro"
flatpak --user override \
    --filesystem="/usr/share/icons/:ro"
flatpak --user override \
    --env=XCURSOR_PATH="$HOME/.icons"
flatpak --user override \
    --env=XCURSOR_THEME=Bibata-Modern-Classic

# Install apps from package list
mapfile -t APPS < <(grep -v '^\s*$' "$PACKAGES_FILE")
for app in "${APPS[@]}"; do
    echo "[flatpak] Installing: $app"
    flatpak install -y flathub "$app"
done

echo "[flatpak] All applications installed!"
