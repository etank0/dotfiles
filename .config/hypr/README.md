# Fedora Hyprland Setup

## Wayland utilities

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

- `nmtui` is provided by `NetworkManager-tui`
  (usually installed by default).
- `kf6-qqc2-desktop-style` is useful for KDE
  applications such as KDE Connect.
- `foot` is required for Alt-Tab integration.

---

## Enable Hyprland COPR

```bash
sudo dnf copr enable lionheartp/Hyprland
```

---

## Hyprland packages

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

Optional (relying less on plugins):

```bash
sudo dnf install pyprland hyprland-devel
```

---

## Cargo packages

```bash
cargo install yazi-fm
cargo install ripdrag
```

---

## Build from source

```text
nwg-look
rofi-calc
```

---

## Optional Hyprland plugins

```bash
hyprpm add \
    https://github.com/hyprwm/hyprland-plugins
hyprpm add \
    https://github.com/KZDKM/Hyprspace

hyprpm enable hyprbars
hyprpm enable Hyprspace
```

Plugins are optional and may require updates
when Hyprland versions change.
