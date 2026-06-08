# Fedora Hyprland Setup

## Wayland Utilities

```bash
sudo dnf install \
  waybar \
  wlogout \
  wtype \
  openrgb \
  nm-applet \
  rofi-wayland \
  swayimg \
  cliphist \
  swaync \
  kf6-qqc2-desktop-style \
  foot \
  pamixer \
  xdg-desktop-portal \
  xdg-desktop-portal-hyprland
```

### Notes

- `nmtui` is provided by `NetworkManager-tui` (usually installed by default with NetworkManager).
- `kf6-qqc2-desktop-style` is useful for KDE applications such as KDE Connect.
- `foot` is required for Alt-Tab integration.

---

## Enable Hyprland COPR

```bash
sudo dnf copr enable lionheartp/Hyprland
```

---

## Hyprland Packages

```bash
sudo dnf install \
  hyprland \
  hyprpaper \
  hyprlock \
  hypridle \
  hyprshot \
  qt6ct-kde \
  nwg-look
```

> `NOTE`:  Optional (as relying less on plugins)
```bash
 sudo dnf install pyprland hyprland-devel
```

---

## Cargo Packages

```bash
cargo install yazi-fm
cargo install ripdrag
```

---

## Build From Source

```text
nwg-look
rofi-calc
```

---

## Optional Hyprland Plugins

```bash
hyprpm add https://github.com/hyprwm/hyprland-plugins
hyprpm add https://github.com/KZDKM/Hyprspace

hyprpm enable hyprbars
hyprpm enable Hyprspace
```

> Plugins are optional and may require updates when Hyprland versions change.
