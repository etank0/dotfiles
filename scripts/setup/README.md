# dotpkgr setup scripts

## Prerequisites

None beyond bash and coreutils.

## Before running

- Ensure Nvidia is setup
  (refer `./after-install/fedora.md`)
- Enable rpm-fusion and multimedia codecs
  for Fedora

## Manual installs after Nvidia setup

- Chrome
- ProtonVPN

## Usage

```bash
# Show all targets with package counts
dotpkgr list

# Install OS packages for Fedora
dotpkgr install --distro fedora

# Install OS packages for Arch
dotpkgr install --distro arch

# Install OS packages for Debian
dotpkgr install --distro debian

# Install Flatpak apps
dotpkgr install --distro fedora flatpak

# Install GNOME extensions
dotpkgr install gnome

# Install VS Code + extensions
dotpkgr install --distro fedora vscode

# Install Zen browser
dotpkgr install zen

# Setup Zsh + Oh My Zsh + plugins
dotpkgr install zsh

# Install asdf version manager
dotpkgr install asdf

# Install dev tools via asdf
dotpkgr install dev-tools

# Symlink .config/ from dotfiles repo
dotpkgr link configs
```

## Adding packages

```bash
# Add and install a DNF package
dotpkgr add fedora htop

# Add without installing (--soft)
dotpkgr add --soft fedora vim

# Add and install a Flatpak app
dotpkgr add flatpak com.app.Name

# Add and install a VS Code extension
dotpkgr add vscode publisher.extension
```

## Removing packages

```bash
# Remove and uninstall a DNF package
dotpkgr remove fedora htop

# Remove without uninstalling (--soft)
dotpkgr remove --soft fedora vim

# Remove a Flatpak app
dotpkgr remove flatpak com.app.Name
```

If the package isn't in the list, the
current packages are shown for reference.

## Architecture

```
.config/dotpkgr/dotpkgr.conf
  Target registry (name|script|os_verification)

scripts/setup/
├── packages/                 ← Plain text lists
│   ├── fedora.txt            One package per line
│   ├── arch.txt
│   ├── debian.txt
│   ├── flatpak.txt
│   ├── gnome.txt
│   ├── vscode.txt
│   └── dev-tools.txt
├── os/                       ← OS-level scripts
│   ├── fedora.sh
│   ├── arch.sh
│   ├── debian.sh
│   └── gnome.sh
├── tools/                    ← Tool scripts
│   ├── flatpak.sh
│   ├── vscode.sh
│   ├── zen.sh
│   ├── zsh.sh
│   ├── asdf.sh
│   ├── gnome.sh
│   └── dev-tools.sh
├── utils/                    ← Utility scripts
│   └── link-config.sh        ← Symlink .config/
├── after-install/            ← Post-install notes
│   └── fedora.md
└── README.md
```

## Config format

`dotpkgr.conf` uses pipe-delimited lines:

```
name|script_path|os_verification
```

- `name` — target name for `dotpkgr install`
- `script_path` — relative to `scripts/setup/`
- `os_verification` — `true` if `--distro` is
  required (empty or `false` otherwise)

Lines starting with `#` are comments.

## Package list format

Plain text, one package per line:

```
htop
neovim
ripgrep
```

Sorted alphabetically. No quotes, no
YAML, no JSON — just text.

## link configs

Symlinks every entry in the dotfiles
`.config/` directory to `~/.config/`.
Existing non-symlink configs are backed
up with a `.bak` suffix.

```bash
dotpkgr link configs
# or
scripts/setup/utils/link-config.sh
```

Idempotent — safe to re-run.
