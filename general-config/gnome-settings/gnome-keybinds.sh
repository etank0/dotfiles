#!/usr/bin/env bash
set -euo pipefail

BACKUP_DIR="${2:-gnome-keybinds-bkp}"

export_keybindings() {
    mkdir -p "$BACKUP_DIR"

    dconf dump /org/gnome/desktop/wm/keybindings/ \
        > "$BACKUP_DIR/wm-keybindings.ini"

    dconf dump /org/gnome/settings-daemon/plugins/media-keys/ \
        > "$BACKUP_DIR/media-keys.ini"

    dconf dump /org/gnome/shell/keybindings/ \
        > "$BACKUP_DIR/shell-keybindings.ini"

    dconf dump /org/gnome/mutter/keybindings/ \
        > "$BACKUP_DIR/mutter-keybindings.ini"

    echo "Exported GNOME keybindings to: $BACKUP_DIR"
}

import_keybindings() {
    dconf load /org/gnome/desktop/wm/keybindings/ \
        < "$BACKUP_DIR/wm-keybindings.ini"

    dconf load /org/gnome/settings-daemon/plugins/media-keys/ \
        < "$BACKUP_DIR/media-keys.ini"

    dconf load /org/gnome/shell/keybindings/ \
        < "$BACKUP_DIR/shell-keybindings.ini"

    dconf load /org/gnome/mutter/keybindings/ \
        < "$BACKUP_DIR/mutter-keybindings.ini"

    echo "Imported GNOME keybindings from: $BACKUP_DIR"
}

case "${1:-}" in
    export)
        export_keybindings
        ;;
    import)
        import_keybindings
        ;;
    *)
        echo "Usage:"
        echo "  $0 export [backup-dir]"
        echo "  $0 import [backup-dir]"
        exit 1
        ;;
esac
