#!/bin/sh

# Default to 'rpm' if PACKAGE_TYPE environment variable is not set
PACKAGE_TYPE="${PACKAGE_TYPE:-rpm}"

# Function to install gnome-shell-extensions utility
install_extensions_utility() {
  case "$PACKAGE_TYPE" in
    arch)
      echo "Arch-based system detected. Installing gnome-shell-extensions..."
      sudo pacman -S --noconfirm gnome-shell-extensions
      ;;
    deb)
      echo "Debian-based system detected. Installing gnome-shell-extensions..."
      sudo apt install -y gnome-shell-extensions
      ;;
    rpm)
      echo "RPM-based system detected. Installing gnome-shell-extensions..."
      sudo dnf install -y gnome-extensions
      ;;
    *)
      echo "Unknown package type: $PACKAGE_TYPE"
      exit 1
      ;;
  esac
}

# Install gnome-shell-extensions utility (only once)
install_extensions_utility

# List of GNOME extensions (from https://extensions.gnome.org/)
extensions=(
  "blur-my-shell@aunetx"
  "Vitals@CoreCoding.com"
  "space-bar@luchrioh"
  "dash-to-panel@jderose9.github.com"
  "arcmenu@arcmenu.com"
  "appindicatorsupport@rgcjonas.gmail.com"
  "gsconnect@andyholmes.github.io"
)

# Ensure the extensions directory exists
EXT_DIR="$HOME/.local/share/gnome-shell/extensions"
mkdir -p "$EXT_DIR"

# Install and enable each extension
for ext in "${extensions[@]}"; do
  echo "Processing $ext..."

  # Check if the extension was installed and enabled
  if ! gnome-extensions list | grep --quiet "$ext"; then
    echo "⚠️ Failed to install or enable $ext, trying remote installation..."
    busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s "$ext"
  fi
done

# Load the dconf backup from the specific path
BACKUP_PATH="$HOME/mygithub/dotfiles/general-config/gnome-settings/dconf-full-backup.txt"
if [ -f "$BACKUP_PATH" ]; then
  echo "Restoring settings from $BACKUP_PATH..."
  sudo dconf load / < "$BACKUP_PATH"
else
  echo "⚠️ dconf backup file not found: $BACKUP_PATH"
fi

echo "✅ All extensions installed, enabled, and settings restored successfully."

