# Fedora After Install Setup

`NOTE`: Refer these
[`https://github.com/devangshekhawat/Fedora-42-Post-Install-Guide`](https://github.com/devangshekhawat/Fedora-42-Post-Install-Guide)
[`https://github.com/roworu/nvidia-fedora-secureboot`](https://github.com/roworu/nvidia-fedora-secureboot)

### Update dnf settings

`/etc/dnf/dnf.conf` inside `[main]`
```
fastestmirror=true
max_paraller_downloads=3
```

### Install multimedia codecs
```bash
sudo dnf group install -y multimedia
sudo dnf group install -y sound-and-video
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing # Switch to full FFMPEG.
sudo dnf upgrade @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin # Installs gstreamer components. Required if you use Gnome Videos and other dependent applications.
```

### Install Nvidia Drivers
```bash
sudo dnf install akmod-nvidia nvidia-smi
```
