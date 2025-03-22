#!/bin/sh

# Exit on errors
set -e

# Ensure we have sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root or use: sudo $0"
    exit 1
fi

echo "Updating package repositories..."
dnf update -y

# Install packages via dnf
PACKAGES=(
    zsh
    kitty
    tmux
    fzf
    bat
    ripgrep
    vim
    neovim
    mpv
    celluloid
    gnome-tweaks
    deluge
    yt-dlp
    ffmpeg
    aria2
    qjackctl
    obs-studio
    syncplay
    discord
    zathura
    zathura-pdf-mupdf
    zathura-djvu
)

echo "Installing packages..."
dnf install -y "${PACKAGES[@]}"

echo "Installation complete!"
