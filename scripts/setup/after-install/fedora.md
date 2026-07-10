# Fedora After Install Setup

Refer to these guides:
- [Fedora 42 Post Install Guide](https://github.com/devangshekhawat/Fedora-42-Post-Install-Guide)
- [Nvidia Fedora Secureboot](https://github.com/roworu/nvidia-fedora-secureboot)

### Update dnf settings

`/etc/dnf/dnf.conf` inside `[main]`:

```ini
[main]
installonly_limit=2
fastestmirror=true
max_parallel_downloads=3
```

### Install multimedia codecs

```bash
sudo dnf group install -y multimedia
sudo dnf group install -y sound-and-video

# Switch to full ffmpeg
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing

# Install gstreamer components
# Required for gnome videos and other apps
sudo dnf upgrade @multimedia \
    --setopt="install_weak_deps=False" \
    --exclude=PackageKit-gstreamer-plugin
```

### Install Nvidia drivers

```bash
sudo dnf install akmod-nvidia nvidia-smi
```

### Network/WiFi disconnects

```bash
sudo tee /etc/NetworkManager/conf.d/00-wifi-powersave.conf \
    << 'EOF' > /dev/null
[connection]
wifi.powersave=2
EOF

sudo systemctl restart NetworkManager.service
```
