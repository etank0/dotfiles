#!/bin/bash

set -euo pipefail

echo "[zsh] Setting up Zsh + Oh My Zsh..."

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Starship
if ! command_exists starship; then
    echo "[zsh] Installing Starship..."
    curl -fsSL https://starship.rs/install.sh \
        | sh -s -- -y
else
    echo "[zsh] Starship already installed."
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "[zsh] Installing Oh My Zsh..."
    OMZ_URL="https://raw.githubusercontent.com"
    OMZ_URL+="/ohmyzsh/ohmyzsh/master/tools/install.sh"
    curl -fsSL "$OMZ_URL" | sh -s -- --unattended
else
    echo "[zsh] Oh My Zsh already installed."
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install zsh-autosuggestions
ASUGGEST_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
if [ ! -d "$ASUGGEST_DIR" ]; then
    echo "[zsh] Installing zsh-autosuggestions..."
    git clone \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ASUGGEST_DIR"
else
    echo "[zsh] zsh-autosuggestions already installed."
fi

# Install zsh-syntax-highlighting
SYNTAX_DIR="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
if [ ! -d "$SYNTAX_DIR" ]; then
    echo "[zsh] Installing zsh-syntax-highlighting..."
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        "$SYNTAX_DIR"
else
    echo "[zsh] zsh-syntax-highlighting already installed."
fi

# Set Zsh as default shell
if [ "$SHELL" != "$(command -v zsh)" ]; then
    echo "[zsh] Setting Zsh as default shell..."
    chsh -s "$(command -v zsh)"
else
    echo "[zsh] Zsh is already default shell."
fi

echo "[zsh] Setup complete."
