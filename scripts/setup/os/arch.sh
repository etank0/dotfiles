#!/bin/bash

# Exit on errors
set -e

# Ensure we have sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo "[arch] Requesting sudo access..."
    exec sudo "$0" "$@"
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
