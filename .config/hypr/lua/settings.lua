local vars = require("lua.vars")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@120",
  position = "0x0",
  scale = 1,
  transform = 0,
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@60",
  position = "1920x0",
  scale = 1.5,
  transform = 1,
})

hl.monitor({
  output = "",
  mode = "preferred",
  position = "0x-1080",
  scale = 1,
})

for i = 1, 6 do
  hl.workspace_rule({ workspace = i, monitor = "eDP-1" })
end

hl.workspace_rule({
  workspace = "special:alttab",
  gaps_out = 0,
  gaps_in = 0,
  border_size = 0,
})

hl.on("hyprland.start", function()
  hl.exec_cmd("nm-applet --indicator &")
  hl.exec_cmd("blueman-applet &")
  hl.exec_cmd("waybar & swaync & hypridle")
  hl.exec_cmd("hyprpaper &")
  hl.exec_cmd("/usr/libexec/polkit-mate-authentication-agent-1")
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
  hl.exec_cmd("wl-paste --watch cliphist store")
  hl.exec_cmd("bash " .. vars.scripts .. "/hyprwalchange.sh")
  hl.exec_cmd("bash " .. vars.scripts .. "/inactive-kb-toggle.sh")
  hl.exec_cmd("google-chrome --app=https://music.youtube.com/")
  hl.exec_cmd("kitty --class cava-scratchpad -e cava")
  hl.exec_cmd("kitty --class scribbles-term -d ~/mygithub/scribbles")
  hl.exec_cmd(
    "gsettings set org.gnome.desktop.interface color-scheme prefer-dark"
  )
  hl.exec_cmd(
    "gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark"
  )
  hl.exec_cmd("foot --server -c $HOME/.config/foot/foot.ini")
  hl.exec_cmd(
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
  )
end)

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",
    follow_mouse = 1,
    sensitivity = 0,
    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

hl.config({
  cursor = {
    no_hardware_cursors = false,
  },
})

hl.config({
  general = {
    gaps_out = 0,
    gaps_in = 0,
    border_size = 1,
    col = {
      active_border = "rgba(82aaffff)",
      inactive_border = "rgba(4a4a4cff)",
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },
})

hl.config({
  decoration = {
    rounding = 0,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    blur = {
      enabled = true,
      size = 4,
      passes = 2,
      vibrancy = 0.1696,
      new_optimizations = true,
    },
    shadow = {
      enabled = true,
      range = 20,
      render_power = 4,
      color = "rgba(1a1a1aee)",
    },
  },
})

hl.curve("myBezier", {
  type = "bezier",
  points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.config({
  animations = {
    enabled = true,
  },
})

local speedVar = 2
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 1,
  bezier = "myBezier",
  style = "popin 80%",
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 1,
  bezier = "default",
})
hl.animation({
  leaf = "border",
  enabled = true,
  speed = speedVar,
  bezier = "default",
})
hl.animation({
  leaf = "borderangle",
  enabled = true,
  speed = speedVar,
  bezier = "default",
})
hl.animation({
  leaf = "fade",
  enabled = true,
  speed = speedVar,
  bezier = "default",
})
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = speedVar,
  bezier = "default",
})

hl.config({
  dwindle = {
    force_split = 2,
    preserve_split = true,
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
})

hl.config({
  debug = {
    disable_logs = false,
  },
})
