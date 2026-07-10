#!/bin/bash

set -euo pipefail

BASE_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
PACKAGES_FILE="${BASE_DIR}/scripts/setup/packages/fedora.txt"

if [[ $EUID -ne 0 ]]; then
    echo "[fedora] Requesting sudo access..."
    exec sudo "$0" "$@"
fi

echo "[fedora] Updating package repositories..."
dnf update -y

echo "[fedora] Installing packages..."
mapfile -t PACKAGES < <(grep -v '^\s*$' "$PACKAGES_FILE")
dnf install -y "${PACKAGES[@]}"

echo "[fedora] Installation complete!"
