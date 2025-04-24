#!/bin/sh

# List of setup scripts
SCRIPTS=(
    "flatpak-install.sh"
    "vscode-install.sh"
    "zen-install.sh"
    "asdf-install.sh"
    "dev-install.sh"
)

# Run all other scripts
for script in "${SCRIPTS[@]}"; do
    if [ -x "./$script" ]; then
        echo "Running $script..."
        ./"$script"
    else
        echo "Skipping $script (not executable or missing)"
    fi
done

echo "General installations/setups completed!"

