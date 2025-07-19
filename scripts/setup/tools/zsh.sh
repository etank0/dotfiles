#!/bin/bash

set -euo pipefail

echo "[*] Setting up Zsh with Oh My Zsh, Starship, and plugins..."

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Starship
if ! command_exists starship; then
    echo "[*] Installing Starship..."
    curl -fsSL https://starship.rs/install.sh | sh -s -- -y
else
    echo "[✔] Starship is already installed."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "[*] Installing Oh My Zsh..."
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --unattended
else
    echo "[✔] Oh My Zsh is already installed."
fi

# Plugin base directory
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "[*] Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "[✔] zsh-autosuggestions is already installed."
fi

# Install zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "[*] Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "[✔] zsh-syntax-highlighting is already installed."
fi

# Set Zsh as default shell
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "[*] Setting Zsh as the default shell..."
    chsh -s "$(command -v zsh)"
else
    echo "[✔] Zsh is already the default shell."
fi

echo "[✓] Zsh setup completed."

