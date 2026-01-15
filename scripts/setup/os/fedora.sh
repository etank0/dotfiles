#!/bin/sh

# Exit on errors
set -e

# Ensure we have sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo "[fedora] Requesting sudo access..."
    exec sudo "$0" "$@"
fi

echo "Updating package repositories..."
dnf update -y

# Install packages via dnf
PACKAGES=(
    adw-gtk3-theme
    aria2
    bat
    blueman
    breeze-icons
    cava
    celluloid
    deluge
    fastfetch
    ffmpeg
    foliate
    fzf
    gnome-tweaks
    kitty
    kvantum
    mpv
    neovim
    # obs-studio
    openrgb
    pavucontrol
    qjackctl
    qt5ct
    qt6ct
    ripgrep
    syncplay
    tmux
    vim
    wf-recorder
    yt-dlp
    zathura
    zathura-djvu
    zathura-pdf-mupdf
    zoxide
    zsh
)

echo "Installing packages..."
dnf install -y "${PACKAGES[@]}"

echo "Installation complete!"
