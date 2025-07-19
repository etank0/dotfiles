#!/bin/bash

set -e

# Microsoft official URLs
DEB_URL="https://go.microsoft.com/fwlink/?LinkID=760868"
RPM_URL="https://go.microsoft.com/fwlink/?LinkID=760867"

# Set DISTRO manually or fall back to auto-detection for Arch
DISTRO="${DISTRO:-}"
if [[ -z "$DISTRO" && -f /etc/arch-release ]]; then
  DISTRO="arch"
fi

# Download directory
DOWNLOAD_DIR="$HOME/Downloads"
mkdir -p "$DOWNLOAD_DIR"

install_vscode_arch() {
  echo "[vscode] Arch Linux detected — installing from AUR using yay..."
  yay -S --noconfirm visual-studio-code-bin
}

install_vscode_deb() {
  local file="$DOWNLOAD_DIR/vscode.deb"
  echo "[vscode] Downloading .deb from $DEB_URL"
  curl -fsSL -o "$file" "$DEB_URL"

  echo "[vscode] Installing .deb package..."
  sudo dpkg -i "$file" || sudo apt-get install -f -y

  echo "[vscode] Cleaning up..."
  rm -f "$file"
}

install_vscode_rpm() {
  local file="$DOWNLOAD_DIR/vscode.rpm"
  echo "[vscode] Downloading .rpm from $RPM_URL"
  curl -fsSL -o "$file" "$RPM_URL"

  echo "[vscode] Installing .rpm package..."
  if command -v dnf >/dev/null; then
    sudo dnf install -y "$file"
  else
    sudo rpm -i "$file"
  fi

  echo "[vscode] Cleaning up..."
  rm -f "$file"
}

install_vscode_extensions() {
  echo "[vscode] Installing extensions..."

  local extensions=(
    asvetliakov.vscode-neovim
    bradlc.vscode-tailwindcss
    dsznajder.es7-react-js-snippets
    eamodio.gitlens
    editorconfig.editorconfig
    esbenp.prettier-vscode
    haskell.haskell
    justusadam.language-haskell
    mkhl.direnv
    ms-python.black-formatter
    ms-python.debugpy
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.jupyter
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-toolsai.vscode-jupyter-cell-tags
    ms-toolsai.vscode-jupyter-slideshow
    ms-vscode.cpptools
    pkief.material-icon-theme
    pkief.material-product-icons
    rust-lang.rust-analyzer
    ryuta46.multi-command
    t3dotgg.vsc-material-theme-but-i-wont-sue-you
    tomrijndorp.find-it-faster
    usernamehw.errorlens
    llvm-vs-code-extensions.vscode-clangd
    sumneko.lua
    jdinhlife.gruvbox
    golang.go
    catppuccin.catppuccin-vsc
    pmndrs.pmndrs
    continue.continue
    saoudrizwan.claude-dev
  )

  for ext in "${extensions[@]}"; do
    code --install-extension "$ext"
  done
}

# Main control flow
case "$DISTRO" in
  arch)
    install_vscode_arch
    ;;
  debian | ubuntu)
    install_vscode_deb
    ;;
  fedora | rhel | centos)
    install_vscode_rpm
    ;;
  *)
    echo "[vscode] ❌ Unknown or unsupported DISTRO: $DISTRO"
    echo "Set the DISTRO env variable to one of: arch, debian, ubuntu, fedora"
    exit 1
    ;;
esac

install_vscode_extensions

echo "[vscode] ✅ VSCode setup complete."

