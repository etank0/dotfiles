#!/bin/bash

set -euo pipefail

# Detect OS and ARCH
platform="linux"
arch="$(uname -m)"
case "$arch" in
    x86_64)         arch="amd64" ;;
    aarch64|arm64)  arch="arm64" ;;
    i386|i686)      arch="386" ;;
    *)
        echo "[asdf] Unsupported arch: $arch"
        exit 1
        ;;
esac

# Get latest version tag
latest=$(curl -s \
    https://api.github.com/repos/asdf-vm/asdf/releases/latest \
    | grep '"tag_name":' \
    | head -n1 \
    | cut -d '"' -f4)

# Construct download URL
filename="asdf-${latest}-${platform}-${arch}.tar.gz"
url="https://github.com/asdf-vm/asdf/releases"
url+="/download/${latest}/${filename}"

echo "[asdf] Downloading $filename..."
mkdir -p "$HOME/bin"
curl -sL "$url" | tar -xzf - -C "$HOME/bin"

echo "[asdf] Installed asdf ${latest}"
