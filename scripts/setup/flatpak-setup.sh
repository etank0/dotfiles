#!/bin/bash

# Default to 'rpm' if PACKAGE_TYPE environment variable is not set
PACKAGE_TYPE="${PACKAGE_TYPE:-rpm}"

# Function to check if flatpak is installed
check_flatpak_installed() {
  if ! command -v flatpak &>/dev/null; then
    echo "Flatpak is not installed. Installing Flatpak..."
    case "$PACKAGE_TYPE" in
      arch)
        sudo pacman -S flatpak
        ;;
      deb)
        sudo apt install flatpak -y
        ;;
      rpm)
        sudo dnf install flatpak -y
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

# Function to check if flathub is added as a remote
check_flathub_enabled() {
  if ! flatpak remotes | grep -q flathub; then
    echo "Flathub is not enabled. Adding Flathub..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  else
    echo "Flathub is already enabled."
  fi
}

# Function to install Extension Manager via Flatpak
install_extension_manager() {
  echo "Installing Extension Manager via Flatpak..."
  flatpak install -y flathub com.mattjakeman.ExtensionManager
}

# Function to install Postman via Flatpak
install_postman() {
  echo "Installing Postman via Flatpak..."
  flatpak install -y flathub com.getpostman.Postman
}

# Function to install Kdenlive via Flatpak
install_kdenlive() {
  echo "Installing Kdenlive via Flatpak..."
  flatpak install -y flathub org.kde.kdenlive
}

# Function to install Telegram via Flatpak
install_telegram() {
  echo "Installing Telegram via Flatpak..."
  flatpak install -y flathub org.telegram.desktop
}

# Apply Flatpak overrides for icon directories
apply_flatpak_overrides() {
  echo "Applying Flatpak overrides for icon directories..."
  flatpak --user override --filesystem=/home/$USER/.icons/:ro
  flatpak --user override --filesystem=/usr/share/icons/:ro
}

# Check if Flatpak is installed and Flathub is enabled
check_flatpak_installed
check_flathub_enabled

# Apply the Flatpak overrides
apply_flatpak_overrides

# Install all the apps via Flatpak
install_postman
install_kdenlive
install_telegram
install_extension_manager

echo "Postman, Kdenlive, and Telegram and Extension Manager have been installed successfully via Flatpak!"

