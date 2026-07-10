#!/bin/bash

set -euo pipefail

BASE_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
PACKAGES_FILE="${BASE_DIR}/scripts/setup/packages/vscode.txt"

# Microsoft download URLs
DEB_URL="https://go.microsoft.com/fwlink/?LinkID=760868"
RPM_URL="https://go.microsoft.com/fwlink/?LinkID=760867"

# Detect distro
DISTRO="${DISTRO:-}"
if [[ -z "$DISTRO" ]]; then
    if [[ -f /etc/arch-release ]]; then DISTRO="arch"
    elif [[ -f /etc/debian_version ]]; then DISTRO="debian"
    elif [[ -f /etc/fedora-release ]]; then DISTRO="fedora"
    fi
fi

DOWNLOAD_DIR="$HOME/Downloads"
mkdir -p "$DOWNLOAD_DIR"

install_vscode_arch() {
    echo "[vscode] Installing from AUR using yay..."
    yay -S --noconfirm visual-studio-code-bin
}

install_vscode_deb() {
    local file="$DOWNLOAD_DIR/vscode.deb"
    echo "[vscode] Downloading .deb..."
    curl -fsSL -o "$file" "$DEB_URL"
    sudo dpkg -i "$file" || sudo apt-get install -f -y
    rm -f "$file"
}

install_vscode_rpm() {
    local file="$DOWNLOAD_DIR/vscode.rpm"
    echo "[vscode] Downloading .rpm..."
    curl -fsSL -o "$file" "$RPM_URL"
    if command -v dnf &>/dev/null; then
        sudo dnf install -y "$file"
    else
        sudo rpm -i "$file"
    fi
    rm -f "$file"
}

case "$DISTRO" in
    arch)                install_vscode_arch ;;
    debian|ubuntu)       install_vscode_deb ;;
    fedora|rhel|centos)  install_vscode_rpm ;;
    *)
        echo "[vscode] Unknown or unsupported DISTRO: $DISTRO"
        echo "Set DISTRO to one of: arch, debian, ubuntu, fedora"
        exit 1
        ;;
esac

# Install extensions from package list
echo "[vscode] Installing extensions..."
while IFS= read -r ext; do
    [[ -z "$ext" ]] && continue
    code --install-extension "$ext"
done < "$PACKAGES_FILE"

echo "[vscode] Setup complete."
