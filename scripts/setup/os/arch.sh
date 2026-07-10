#!/bin/bash

set -euo pipefail

BASE_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
PACKAGES_FILE="${BASE_DIR}/scripts/setup/packages/arch.txt"

if [[ $EUID -ne 0 ]]; then
    echo "[arch] Requesting sudo access..."
    exec sudo "$0" "$@"
fi

echo "[arch] Updating system..."
pacman -Syu --noconfirm

echo "[arch] Installing packages..."
mapfile -t PACKAGES < <(grep -v '^\s*$' "$PACKAGES_FILE")
pacman -S --noconfirm "${PACKAGES[@]}"

echo "[arch] Installation complete!"
