#!/bin/bash

set -euo pipefail

APP_NAME="zen"
INSTALL_DIR_NAME=".tarball-installations"
INSTALL_BASE_DIR="$HOME/$INSTALL_DIR_NAME"
APP_INSTALL_DIR="$INSTALL_BASE_DIR/$APP_NAME"
TARBALL_URL="https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz"
TMP_TAR_PATH="$(mktemp /tmp/zen.XXXXXX.tar.xz)"
TARBALL_DIR_NAME="zen"
LOCAL_BIN="$HOME/.local/bin"
LOCAL_DESKTOP="$HOME/.local/share/applications"
APP_BIN="$LOCAL_BIN/$APP_NAME"
DESKTOP_FILE="$LOCAL_DESKTOP/$APP_NAME.desktop"
ICON_PATH="$APP_INSTALL_DIR/browser/chrome/icons/default/default128.png"
EXECUTABLE_PATH="$APP_INSTALL_DIR/zen"

echo "[zen] Installing Zen Browser..."

# Clean previous installation
rm -f "$APP_BIN" "$DESKTOP_FILE"
rm -rf "$APP_INSTALL_DIR"

# Download and extract
echo "[zen] Downloading Zen tarball..."
curl -L -o "$TMP_TAR_PATH" "$TARBALL_URL"
echo "[zen] Extracting Zen..."
tar -xJf "$TMP_TAR_PATH"

mkdir -p "$INSTALL_BASE_DIR"
mv "$TARBALL_DIR_NAME" "$APP_INSTALL_DIR"
rm "$TMP_TAR_PATH"

# Symlink binary
mkdir -p "$LOCAL_BIN"
cat > "$APP_BIN" <<EOF
#!/bin/bash
exec "$EXECUTABLE_PATH" "\$@"
EOF
chmod +x "$APP_BIN"

# Desktop entry
mkdir -p "$LOCAL_DESKTOP"
cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Name=Zen Browser
Comment=Privacy-focused web browser
Exec=$EXECUTABLE_PATH %u
Icon=$ICON_PATH
Terminal=false
Type=Application
StartupNotify=true
StartupWMClass=zen
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
Actions=new-window;new-private-window;profile-manager-window;

[Desktop Action new-window]
Name=Open a New Window
Exec=$EXECUTABLE_PATH --new-window %u

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=$EXECUTABLE_PATH --private-window %u

[Desktop Action profile-manager-window]
Name=Open the Profile Manager
Exec=$EXECUTABLE_PATH --ProfileManager
EOF

echo "[✔] Zen installed successfully."

