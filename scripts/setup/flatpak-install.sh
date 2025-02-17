#!/bin/sh

# Default to 'rpm' if PACKAGE_TYPE environment variable is not set
PACKAGE_TYPE="${PACKAGE_TYPE:-rpm}"

# List of Flatpak applications to install
FLATPAK_APPS=(
  com.getpostman.Postman
  org.kde.kdenlive
  org.telegram.desktop
  com.mattjakeman.ExtensionManager
  com.obsproject.Studio
)

# Function to check if Flatpak is installed
check_flatpak_installed() {
  if ! command -v flatpak &>/dev/null; then
    echo "Flatpak is not installed. Installing Flatpak..."
    case "$PACKAGE_TYPE" in
      arch)
        sudo pacman -S --noconfirm flatpak
        ;;
      deb)
        sudo apt install -y flatpak
        ;;
      rpm)
        sudo dnf install -y flatpak
        ;;
      *)
        echo "Unknown package type: $PACKAGE_TYPE"
        exit 1
        ;;
    esac
  else
    echo "Flatpak is already installed."
  fi
}

# Function to check if Flathub is added as a remote
check_flathub_enabled() {
  if ! flatpak remotes | grep -q flathub; then
    echo "Flathub is not enabled. Adding Flathub..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  else
    echo "Flathub is already enabled."
  fi
}

# Apply Flatpak overrides for icon directories
apply_flatpak_overrides() {
  echo "Applying Flatpak overrides for icon directories..."
  flatpak --user override --filesystem=/home/$USER/.icons/:ro
  flatpak --user override --filesystem=/usr/share/icons/:ro
}

# Function to install Flatpak applications in a loop
install_flatpak_apps() {
  for app in "${FLATPAK_APPS[@]}"; do
    echo "Installing $app via Flatpak..."
    flatpak install -y flathub "$app"
  done
}

# Execute the functions
check_flatpak_installed
check_flathub_enabled
apply_flatpak_overrides
install_flatpak_apps

echo "All requested applications have been installed successfully via Flatpak!"

