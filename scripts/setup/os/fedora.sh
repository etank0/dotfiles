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
    celluloid
    deluge
    fastfetch
    ffmpeg
    foliate
    fzf
    gnome-tweaks
    kitty
    mpv
    neovim
    # obs-studio
    openrgb
    pavucontrol
    qjackctl
    ripgrep
    syncplay
    tmux
    vim
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
