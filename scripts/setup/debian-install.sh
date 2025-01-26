#!/bin/bash

# Exit on errors
set -e

# Ensure sudo
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script as root or use: sudo $0"
    exit 1
fi

echo "Updating system..."
apt update && apt upgrade -y

# Install packages via apt
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
    pipewire-audio
)

echo "Installing packages..."
apt install -y "${PACKAGES[@]}"

echo "Debian-based installation completed!"

