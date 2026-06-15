hl.layer_rule({
  name = "blur-logout",
  match = { namespace = "logout_dialog" },
  blur = true,
})

hl.layer_rule({
  name = "blur-hyprswitch",
  match = { namespace = "hyprswitch" },
  blur = true,
})
hl.layer_rule({
  name = "ignore-alpha-hyprswitch",
  match = { namespace = "hyprswitch" },
  ignore_alpha = 0.5,
})

hl.layer_rule({
  name = "blur-kitty",
  match = { namespace = "kitty" },
  blur = true,
})

hl.layer_rule({
  name = "blur-waybar",
  match = { namespace = "waybar" },
  blur = true,
})
hl.layer_rule({
  name = "ignore-alpha-waybar",
  match = { namespace = "waybar" },
  ignore_alpha = 0.5,
})

hl.layer_rule({
  name = "blur-rofi",
  match = { namespace = "rofi" },
  blur = true,
})
hl.layer_rule({
  name = "dim-rofi",
  match = { namespace = "rofi" },
  dim_around = true,
})

hl.layer_rule({
  name = "blur-swaync-cc",
  match = { namespace = "swaync-control-center" },
  blur = true,
})
hl.layer_rule({
  name = "blur-swaync-notif",
  match = { namespace = "swaync-notification-window" },
  blur = true,
})
hl.layer_rule({
  name = "ignore-alpha-swaync-cc",
  match = { namespace = "swaync-control-center" },
  ignore_alpha = 0.5,
})
hl.layer_rule({
  name = "ignore-alpha-swaync-notif",
  match = { namespace = "swaync-notification-window" },
  ignore_alpha = 0.5,
})

hl.window_rule({
  name = "suppress-maximize",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "no-blur-empty",
  match = { class = "^()$", title = "^()$" },
  no_blur = true,
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

hl.window_rule({
  name = "overlayed-pin",
  match = { class = "^(Overlayed)$" },
  pin = true,
  float = true,
  no_blur = true,
  no_shadow = true,
  opacity = 1.0,
  move = { 1510, 8 },
  size = { 402, 1036 },
  border_size = 0,
  no_focus = true,
})

-- ALT TAB
hl.workspace_rule({
  workspace = "special:alttab",
  gaps_out = 0,
  gaps_in = 0,
  border_size = 0,
})

hl.window_rule({
  name = "alttab",
  float = true,
  match = { class = "^(alttab)$" },
  size = { "monitor_w * 0.6", "monitor_h * 0.7" },
  no_anim = true,
  stay_focused = true,
  workspace = "special:alttab",
  border_size = 1,
})

hl.window_rule({
  name = "obs-immediate",
  match = { class = "^(obs)$" },
  immediate = true,
})

hl.window_rule({
  name = "scribbles-term",
  match = { class = "^(scribbles-term)$" },
  workspace = "special:magic silent",
  float = true,
  size = { 885, 1030 },
  move = { 4, 12 },
})

hl.window_rule({
  name = "youtube-music",
  match = { class = "^(chrome-music\\.youtube\\.com__-Default)$" },
  workspace = "special:magic silent",
  float = true,
  size = { 478, 746 },
  move = { 901, 12 },
})

hl.window_rule({
  name = "cava-scratchpad",
  match = { class = "^(cava-scratchpad)$" },
  workspace = "special:magic silent",
  float = true,
  size = { 524, 499 },
  move = { 1389, 543 },
})
