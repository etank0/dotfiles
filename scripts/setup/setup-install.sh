#!/bin/bash

# Exit on errors
set -e

# Detect package manager based on PACKAGE_TYPE
install_packages() {
    case "$PACKAGE_TYPE" in
        fedora)
            echo "Detected Fedora system. Running fedora-install.sh..."
            sudo ./fedora-install.sh
            ;;
        arch)
            echo "Detected Arch-based system. Running arch-install.sh..."
            sudo ./arch-install.sh
            ;;
        debian)
            echo "Detected Debian-based system. Running debian-install.sh..."
            sudo ./debian-install.sh
            ;;
        *)
            echo "PACKAGE_TYPE not set or unsupported. Skipping package installation."
            ;;
    esac
}

# Call other setup scripts
run_setup_scripts() {
    echo "Running general setup scripts..."

    for script in copy-files.sh flatpak-setup.sh gnome-setup.sh shell-setup.sh vscode-setup.sh; do
        if [[ -f "$script" && -x "$script" ]]; then
            echo "Executing $script..."
            ./"$script"
        else
            echo "Skipping $script (not found or not executable)."
        fi
    done
}

# Main execution
install_packages
run_setup_scripts

echo "Setup completed!"

