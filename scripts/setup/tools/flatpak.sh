#!/bin/sh

# Default to 'fedora' if DISTRO environment variable is not set
DISTRO="${DISTRO:-fedora}"

# List of Flatpak applications to install
FLATPAK_APPS=(
  com.discordapp.Discord
  com.mattjakeman.ExtensionManager
  com.obsproject.Studio
  com.usebruno.Bruno
  md.obsidian.Obsidian
  org.kde.kdenlive
  org.telegram.desktop
)

# Function to check if Flatpak is installed
check_flatpak_installed() {
  if ! command -v flatpak >/dev/null 2>&1; then
    echo "[flatpak] Flatpak not found. Installing..."
    case "$DISTRO" in
      arch)
        sudo pacman -S --noconfirm flatpak
        ;;
      debian)
        sudo apt install -y flatpak
        ;;
      fedora)
        sudo dnf install -y flatpak
        ;;
      *)
        echo "[flatpak] Unknown distro: $DISTRO"
        exit 1
        ;;
    esac
  else
    echo "[flatpak] Flatpak is already installed."
  fi
}

# Function to check if Flathub is added as a remote
check_flathub_enabled() {
  if ! flatpak remotes | grep -q flathub; then
    echo "[flatpak] Flathub not found. Adding it..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  else
    echo "[flatpak] Flathub is already configured."
  fi
}

# Apply Flatpak overrides for icon directories
apply_flatpak_overrides() {
  echo "[flatpak] Applying icon theme overrides..."
  flatpak --user override --filesystem="/home/$USER/.icons/:ro"
  flatpak --user override --filesystem="/usr/share/icons/:ro"
  flatpak --user override --env=XCURSOR_PATH="$HOME/.icons"
  flatpak --user override --env=XCURSOR_THEME=Bibata-Modern-Classic
}

# Function to install Flatpak applications in a loop
install_flatpak_apps() {
  for app in "${FLATPAK_APPS[@]}"; do
    echo "[flatpak] Installing: $app"
    flatpak install -y flathub "$app"
  done
}

# Run all steps
check_flatpak_installed
check_flathub_enabled
apply_flatpak_overrides
install_flatpak_apps

echo "[flatpak] ✅ All applications installed successfully!"

