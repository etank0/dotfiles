#!/bin/bash

set -euo pipefail

BASE_DIR="${DOTFILES_DIR:-$HOME/mygithub/dotfiles}"
PACKAGES_FILE="${BASE_DIR}/scripts/setup/packages/dev-tools.txt"

if ! command -v asdf &>/dev/null; then
    echo "[dev-tools] asdf not found."
    echo "  Run 'dotpkgr install asdf' first."
    exit 1
fi

# Plugin URLs (hardcoded — stable upstream repos)
declare -A PLUGIN_URLS=(
    [golang]="https://github.com/asdf-community/asdf-golang.git"
    [nodejs]="https://github.com/asdf-vm/asdf-nodejs.git"
    [rust]="https://github.com/asdf-community/asdf-rust.git"
)

while IFS= read -r tool; do
    [[ -z "$tool" ]] && continue
    echo "[dev-tools] Setting up $tool..."

    local_url="${PLUGIN_URLS[$tool]:-}"
    if [[ -n "$local_url" ]]; then
        asdf plugin add "$tool" "$local_url" \
            2>/dev/null || true
    else
        asdf plugin add "$tool" 2>/dev/null || true
    fi

    asdf install "$tool" latest
    asdf global "$tool" "$(asdf latest "$tool")"
done < "$PACKAGES_FILE"

# Rust-specific setup
if grep -qxF 'rust' "$PACKAGES_FILE"; then
    rustup default stable
    rustup component add rustfmt clippy
fi

echo "[dev-tools] All tools installed."
