#!/bin/sh

# === 1. Install DaVinci Resolve ===
echo "Installing DaVinci Resolve..."
SKIP_PACKAGE_CHECK=1 ./DaVinci_Resolve_21.0_Linux_2b640f9cda575a1041af8edc10315978.run -i || exit 1

# === 2. Backup bundled libraries that may cause issues on modern systems ===
LIBS_DIR="/opt/resolve/libs"
BACKUP_DIR="$LIBS_DIR/libs-backup"

echo "Creating backup folder at: $BACKUP_DIR"
sudo mkdir -p "$BACKUP_DIR" || exit 1

echo "Moving problematic bundled libraries..."

for pattern in libgio* libglib* libgmodule*; do
    found=0

    for file in "$LIBS_DIR"/$pattern; do
        [ -e "$file" ] || continue

        found=1
        sudo mv "$file" "$BACKUP_DIR/" || exit 1
        echo "Moved: $(basename "$file")"
    done

    if [ "$found" -eq 0 ]; then
        echo "No matching files for $pattern, skipping..."
    fi
done

# === 3. Launch DaVinci Resolve ===
echo "Launching DaVinci Resolve..."
exec /opt/resolve/bin/resolve
