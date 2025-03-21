#!/bin/sh

# Enum-like mapping for package types
declare -A PACKAGE_URLS
PACKAGE_URLS[deb]='https://go.microsoft.com/fwlink/?LinkID=760868'
PACKAGE_URLS[rpm]='https://go.microsoft.com/fwlink/?LinkID=760867'

# Function to check if the system is Arch Linux
is_arch() {
  if [[ -f /etc/arch-release ]]; then
    return 0  # true: it's Arch
  else
    return 1  # false: it's not Arch
  fi
}

# Default to 'rpm' if PACKAGE_TYPE environment variable is not set
PACKAGE_TYPE="${PACKAGE_TYPE:-rpm}"

# Function to download and install the package
download_and_install() {
  local package_type=$1
  local url=${PACKAGE_URLS[$package_type]}
  local download_path="$HOME/Downloads/code.$package_type"

  if [ -z "$url" ]; then
    echo "Invalid package type. Available types: ${!PACKAGE_URLS[@]}"
    exit 1
  fi

  echo "Downloading $package_type package from $url..."
  curl -L -o "$download_path" "$url"

  case "$package_type" in
    deb)
      echo "Installing .deb package..."
      sudo dpkg -i "$download_path"
      sudo apt-get install -f
      ;;
    rpm)
      echo "Installing .rpm package..."
      sudo rpm -i "$download_path"
      ;;
    *)
      echo "Unknown package type: $package_type"
      exit 1
      ;;
  esac

  # Check if the installation was successful
  if [ $? -eq 0 ]; then
    echo "Installation successful, deleting the downloaded package..."
    rm -f "$download_path"
  else
    echo "Installation failed, keeping the downloaded package for troubleshooting."
  fi
}

# Check if system is Arch Linux
if is_arch; then
  echo "Arch Linux detected. Installing VSCode from AUR..."
  yay -S visual-studio-code-bin
else
  # Download and install the appropriate VSCode package for non-Arch systems
  download_and_install "$PACKAGE_TYPE"
fi

# Install VSCode extensions
extensions=(
  "asvetliakov.vscode-neovim"
  "bradlc.vscode-tailwindcss"
  "dsznajder.es7-react-js-snippets"
  "eamodio.gitlens"
  "editorconfig.editorconfig"
  "esbenp.prettier-vscode"
  "github.copilot"
  "github.copilot-chat"
  "haskell.haskell"
  "justusadam.language-haskell"
  "mkhl.direnv"
  "ms-python.black-formatter"
  "ms-python.debugpy"
  "ms-python.python"
  "ms-python.vscode-pylance"
  "ms-toolsai.jupyter"
  "ms-toolsai.jupyter-keymap"
  "ms-toolsai.jupyter-renderers"
  "ms-toolsai.vscode-jupyter-cell-tags"
  "ms-toolsai.vscode-jupyter-slideshow"
  "ms-vscode.cpptools"
  "pkief.material-icon-theme"
  "pkief.material-product-icons"
  "rangav.vscode-thunder-client"
  "rust-lang.rust-analyzer"
  "ryuta46.multi-command"
  "t3dotgg.vsc-material-theme-but-i-wont-sue-you"
  "tomrijndorp.find-it-faster"
  "usernamehw.errorlens"
  "llvm-vs-code-extensions.vscode-clangd"
  "sumneko.lua"
  "jdinhlife.gruvbox"
)

for extension in "${extensions[@]}"; do
  code --install-extension "$extension"
done

