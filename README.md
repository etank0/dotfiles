# dotfiles

Personal configuration files for Fedora/Hyprland.

## Quick start

```bash
# Clone the repo
git clone https://github.com/user/dotfiles \
    ~/mygithub/dotfiles
cd ~/mygithub/dotfiles

# Install dotpkgr and symlink configs
mkdir -p ~/.local/bin
cp .local/bin/* ~/.local/bin/
dotpkgr link configs

# Install OS packages (Fedora)
dotpkgr install --distro fedora

# Install Flatpak apps
dotpkgr install --distro fedora flatpak

# Install dev tools
dotpkgr install zsh
dotpkgr install asdf
dotpkgr install dev-tools
```

## What's inside

### Shell
```text
.bashrc  .zshrc  .zsh_profile  .fzf.zsh  .bash_aliases
```

### Desktop (Hyprland)
```text
hypr  waybar  wlogout  swaync  rofi  foot
kitty  ghostty  alacritty
```

### Editors
```text
nvim  vim  zed  VS Code
```

### CLI tools
```text
tmux  btop  cava  bat  yazi  fastfetch
neofetch  mpv  zathura
```

### Config management
- `.config/` entries are symlinked to `~/.config/`
  via `dotpkgr link configs`
- Package lists live in `scripts/setup/packages/`
- Managed by `dotpkgr` (`.local/bin/dotpkgr`)

## dotpkgr

A minimal package manager for dotfiles.
No external dependencies — bash and coreutils only.

```bash
dotpkgr list                  # Show all targets
dotpkgr install --distro fedora  # Install OS packages
dotpkgr install --distro fedora flatpak
dotpkgr add fedora htop       # Add + install a package
dotpkgr remove fedora htop    # Remove + uninstall
dotpkgr link configs           # Symlink .config/
```

See `scripts/setup/README.md` for full docs.

## Scripts & themes

- `scripts/` — setup scripts
- `general-config/` — gedit, gnome, iterm,
  and other app configs

---
> Managed with
> [`dotpkgr`](.local/bin/dotpkgr).
