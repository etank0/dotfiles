#!/bin/sh

# Install plugins (one command)
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add rust https://github.com/asdf-community/asdf-rust.git

# Install latest stable versions
asdf install golang latest
asdf install nodejs latest
asdf install rust latest

# Set global defaults
asdf global golang $(asdf latest golang)
asdf global nodejs $(asdf latest nodejs)
asdf global rust $(asdf latest rust)

# Install stable toolchain + components
rustup default stable
rustup component add rustfmt clippy

