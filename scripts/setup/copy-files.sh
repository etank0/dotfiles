#!/bin/sh

# Define source and target directories
DOTFILES_CONFIG="$HOME/mygithub/dotfiles/.config"
DOTFILES_BIN="$HOME/mygithub/dotfiles/scripts/bins"
DOTFILES_DESKTOP="$HOME/mygithub/dotfiles/scripts/desktops"
DOTFILES_AUTOSTART="$HOME/mygithub/dotfiles/.config/autostart"
DOTFILES_HOME="$HOME/mygithub/dotfiles"

TARGET_CONFIG="$HOME/.config"
TARGET_BIN="$HOME/.local/bin"
TARGET_DESKTOP="$HOME/.local/share/applications"
TARGET_AUTOSTART="$HOME/.config/autostart"

# Create target directories if they do not exist
mkdir -p "$TARGET_CONFIG"
mkdir -p "$TARGET_BIN"
mkdir -p "$TARGET_DESKTOP"

# Copy dotfiles (hidden files starting with .) to home directory
echo "Copying dotfiles from $DOTFILES_HOME to $HOME..."
find "$DOTFILES_HOME" -maxdepth 1 -type f -name ".*" -exec cp {} "$HOME/" \;

# Copy config files
echo "Copying config files from $DOTFILES_CONFIG to $TARGET_CONFIG..."
cp -r "$DOTFILES_CONFIG/"* "$TARGET_CONFIG/"

# Copy binaries
echo "Copying scripts from $DOTFILES_BIN to $TARGET_BIN..."
cp -r "$DOTFILES_BIN/"* "$TARGET_BIN/"

# Copy desktops
echo "Copying desktops from $DOTFILES_DESKTOP to $TARGET_DESKTOP..."
cp -r "$DOTFILES_DESKTOP/"* "$TARGET_DESKTOP/"

# Function to replace $HOME in desktop files with the actual HOME value
replace_home_in_desktop_files() {
  local desktop_file=$1
  local home_value=$HOME
  # Check if the desktop file name exists in the target desktop directory
  if [ -f "$DOTFILES_DESKTOP/$(basename "$desktop_file")" ] || [ -f "$DOTFILES_AUTOSTART/$(basename "$desktop_file")" ]; then
    # Check if $HOME is in the desktop file but not surrounded by quotes
    if grep -q "\$HOME" "$desktop_file" && ! grep -q '"\$HOME"' "$desktop_file"; then
      # Use sed to replace $HOME with the actual value of HOME environment variable
      sed -i "s|\$HOME|$home_value|g" "$desktop_file"
      echo "Updated $desktop_file"
    else
      echo "Skipping $desktop_file as \$HOME is already quoted or not found"
    fi
  else
    echo "No matching file found for $(basename "$desktop_file") in $DOTFILES_DESKTOP or in $DOTFILES_AUTOSTART, skipping..."
  fi
}

# Update desktop files by replacing $HOME only in files that match the name and contain $HOME (not quoted)
for desktop_file in "$TARGET_DESKTOP"/*.desktop; do
  replace_home_in_desktop_files "$desktop_file"
done

# Also check .desktop files in autostart directory
for desktop_file in "$TARGET_AUTOSTART"/*.desktop; do
  replace_home_in_desktop_files "$desktop_file"
done

# Ask for sudo password once
echo "Setting scripts in $TARGET_BIN as executable..."
sudo bash -c "chmod +x $TARGET_BIN/*"

echo "Configuration, scripts, and desktops successfully installed!"

