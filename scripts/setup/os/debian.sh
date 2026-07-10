#!/bin/bash

set -euo pipefail

BASE_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
PACKAGES_FILE="${BASE_DIR}/scripts/setup/packages/debian.txt"

if [[ $EUID -ne 0 ]]; then
    echo "[debian] Requesting sudo access..."
    exec sudo "$0" "$@"
fi

echo "[debian] Updating system..."
apt update && apt upgrade -y

echo "[debian] Installing packages..."
mapfile -t PACKAGES < <(grep -v '^\s*$' "$PACKAGES_FILE")
apt install -y "${PACKAGES[@]}"

echo "[debian] Installation complete!"
