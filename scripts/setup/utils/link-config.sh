#!/bin/bash

# Symlink .config/ entries from dotfiles repo to ~/.config/
# Only links items that exist in the repo. Existing non-symlink
# configs are backed up with a .bak suffix.

set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
SRC="$DOTFILES_DIR/.config"
DEST="$HOME/.config"

if [[ ! -d "$SRC" ]]; then
    echo "[link-config] Source not found: $SRC"
    exit 1
fi

mkdir -p "$DEST"

linked=0
skipped=0

shopt -s dotglob
for item in "$SRC"/*; do
    name=$(basename "$item")
    target="$DEST/$name"

    # Already a correct symlink
    if [[ -L "$target" && "$(readlink "$target")" == "$item" ]]; then
        continue
    fi

    # Exists but not a symlink — back it up
    if [[ -e "$target" && ! -L "$target" ]]; then
        echo "[link-config] Backing up: $target -> ${target}.bak"
        rm -rf "${target}.bak"
        mv "$target" "${target}.bak"
    fi

    # Remove stale symlink
    [[ -L "$target" ]] && rm -f "$target"

    ln -s "$item" "$target"
    echo "[link-config] Linked: $target -> $item"
    linked=$((linked + 1))
done

echo "[link-config] Done. $linked linked."
