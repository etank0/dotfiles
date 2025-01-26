#!/bin/bash

# Exit on errors
set -e

# Ensure sudo
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root or use: sudo $0"
    exit 1
fi

echo "Updating system..."
pacman -Syu --noconfirm

# Install packages via pacman
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
    pipewire-jack
)

echo "Installing packages..."
pacman -S --noconfirm "${PACKAGES[@]}"

echo "Arch-based installation completed!"
