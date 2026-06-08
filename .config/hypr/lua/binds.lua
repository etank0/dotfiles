local vars = require("lua.vars")

-- General
hl.bind(vars.mainMod .. " + Return", hl.dsp.exec_cmd(vars.terminal))
hl.bind(vars.mainMod .. " + B",      hl.dsp.exec_cmd("zen"))
hl.bind(vars.mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(vars.mainMod .. " + SHIFT + M", hl.dsp.exit())
hl.bind(vars.mainMod .. " + F",      hl.dsp.window.fullscreen())
hl.bind(vars.mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(vars.mainMod .. " + Space",  hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.mainMod .. " + slash",  hl.dsp.exec_cmd(vars.menu))
hl.bind(vars.mainMod .. " + P",      hl.dsp.window.pseudo())
hl.bind(vars.mainMod .. " + V",      hl.dsp.layout("togglesplit"))
hl.bind(vars.mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(vars.mainMod .. " + SHIFT + BackSpace", hl.dsp.exec_cmd("hyprlock"))
hl.bind(
  vars.mainMod .. " + Print",
  hl.dsp.exec_cmd(
    "hyprshot -m output -o " .. vars.screenshot_dir
    .. "; " .. vars.scripts .. "/sounds.sh --screenshot"
  )
)
hl.bind(
  vars.mainMod .. " + SHIFT + Print",
  hl.dsp.exec_cmd(
    "hyprshot -m window -o " .. vars.screenshot_dir
    .. "; " .. vars.scripts .. "/sounds.sh --screenshot"
  )
)
hl.bind(
  "Print",
  hl.dsp.exec_cmd(
    "hyprshot -m region -o " .. vars.screenshot_dir
    .. "; " .. vars.scripts .. "/sounds.sh --screenshot"
  )
)
hl.bind(vars.mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("CTRL + ALT + Delete",  hl.dsp.exec_cmd(vars.scripts .. "/wlogout.sh"))
hl.bind(vars.mainMod .. " + W", hl.dsp.exec_cmd(vars.scripts .. "/toggle-waybar.sh"))
hl.bind(vars.mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(vars.scripts .. "/hyprwalchange.sh"))
hl.bind(vars.mainMod .. " + ALT + R",   hl.dsp.exec_cmd(vars.scripts .. "/refresh.sh"))
hl.bind(vars.mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(vars.scripts .. "/clip-manager.sh"))
hl.bind(vars.mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(vars.scripts .. "/emoji-picker.sh"))
hl.bind(vars.mainMod .. " + E",         hl.dsp.exec_cmd(vars.fileManager))

-- Audio & Media
hl.bind(vars.mainMod .. " + bracketleft",  hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --dec"))
hl.bind(vars.mainMod .. " + bracketright", hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --inc"))
hl.bind(vars.mainMod .. " + backslash",    hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --toggle"))
hl.bind(vars.mainMod .. " + apostrophe",   hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --toggle-mic"))
hl.bind(vars.mainMod .. " + SHIFT + bracketleft",  hl.dsp.exec_cmd(vars.scripts .. "/media-control.sh --prv"))
hl.bind(vars.mainMod .. " + SHIFT + bracketright", hl.dsp.exec_cmd(vars.scripts .. "/media-control.sh --nxt"))
hl.bind(vars.mainMod .. " + SHIFT + backslash",    hl.dsp.exec_cmd(vars.scripts .. "/media-control.sh --pause"))

-- Move focus
hl.bind(vars.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(vars.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(vars.mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(vars.mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Resize window
hl.bind(vars.mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(vars.mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(vars.mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind(vars.mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))

-- Move window
hl.bind(vars.mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(vars.mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(vars.mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(vars.mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Switch workspaces
for i = 1, 8 do
  hl.bind(vars.mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(vars.mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(vars.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(vars.mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(vars.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(vars.mainMod .. " + 9", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(vars.mainMod .. " + 0", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(vars.mainMod .. " + left",  hl.dsp.window.move({ workspace = -1 }))
hl.bind(vars.mainMod .. " + right", hl.dsp.window.move({ workspace = "+1" }))

-- Mouse bindings
hl.bind(vars.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move window to monitors
hl.bind(vars.mainMod .. " + comma",  hl.dsp.focus({ monitor = -1 }))
hl.bind(vars.mainMod .. " + period", hl.dsp.focus({ monitor = "+1" }))
hl.bind(vars.mainMod .. " + SHIFT + left",  hl.dsp.window.move({ monitor = -1 }))
hl.bind(vars.mainMod .. " + SHIFT + right", hl.dsp.window.move({ monitor = "+1" }))

-- Magnifier
hl.bind(vars.mainMod .. " + Z",        hl.dsp.exec_cmd(vars.scripts .. "/magnifier.sh toggle"))
hl.bind(vars.mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd(vars.scripts .. "/magnifier.sh zoom-in"))
hl.bind(vars.mainMod .. " + ALT + Z",  hl.dsp.exec_cmd(vars.scripts .. "/magnifier.sh zoom-out"))

-- Laptop multimedia keys
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --inc"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --dec"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd(vars.scripts .. "/volume-control.sh --toggle-mic"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessUp",
  hl.dsp.exec_cmd(vars.scripts .. "/brightness.sh --inc"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd(vars.scripts .. "/brightness.sh --dec"),
  { locked = true, repeating = true }
)
hl.bind(vars.mainMod .. " + SHIFT + 9",     hl.dsp.exec_cmd(vars.scripts .. "/brightness.sh --dec"))
hl.bind(vars.mainMod .. " + SHIFT + 0",     hl.dsp.exec_cmd(vars.scripts .. "/brightness.sh --inc"))
hl.bind(vars.mainMod .. " + SHIFT + minus", hl.dsp.exec_cmd(vars.scripts .. "/brightness.sh --dec"))
hl.bind(vars.mainMod .. " + SHIFT + equal", hl.dsp.exec_cmd(vars.scripts .. "/brightness.sh --inc"))

-- Playerctl
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Discord toggle mute
hl.bind("CTRL + Pause", hl.dsp.send_shortcut({
  mods = "CTRL SHIFT", key = "M", window = "^(discord)$"
}))

-- ALT-TAB (SUBMAP)
hl.bind("ALT + TAB",       hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/alttab/enable.sh 'down'"))
hl.bind("ALT + SHIFT + TAB", hl.dsp.exec_cmd("$HOME/.config/hypr/scripts/alttab/enable.sh 'up'"))

hl.define_submap("alttab", function()
  hl.bind("ALT + TAB", hl.dsp.send_shortcut({ mods = "", key = "tab", window = "alttab" }))
  hl.bind("ALT + SHIFT + TAB", hl.dsp.send_shortcut({
    mods = "shift", key = "tab", window = "alttab"
  }))
  hl.bind(
    "ALT + ALT_L",
    hl.dsp.exec_cmd(
      "$HOME/.config/hypr/scripts/alttab/disable.sh ;"
      .. " hyprctl -q dispatch sendshortcut , return,class:alttab"
    ),
    { release = true }
  )
  hl.bind(
    "ALT + SHIFT + ALT_L",
    hl.dsp.exec_cmd(
      "$HOME/.config/hypr/scripts/alttab/disable.sh ;"
      .. " hyprctl -q dispatch sendshortcut , return,class:alttab"
    ),
    { release = true }
  )
  hl.bind(
    "ALT + Return",
    hl.dsp.exec_cmd(
      "$HOME/.config/hypr/scripts/alttab/disable.sh ;"
      .. " hyprctl -q dispatch sendshortcut , return, class:alttab"
    )
  )
  hl.bind(
    "ALT + SHIFT + Return",
    hl.dsp.exec_cmd(
      "$HOME/.config/hypr/scripts/alttab/disable.sh ;"
      .. " hyprctl -q dispatch sendshortcut , return, class:alttab"
    )
  )
  hl.bind(
    "ALT + Escape",
    hl.dsp.exec_cmd(
      "$HOME/.config/hypr/scripts/alttab/disable.sh ;"
      .. " hyprctl -q dispatch sendshortcut , escape,class:alttab"
    )
  )
  hl.bind(
    "ALT + SHIFT + Escape",
    hl.dsp.exec_cmd(
      "$HOME/.config/hypr/scripts/alttab/disable.sh ;"
      .. " hyprctl -q dispatch sendshortcut , escape,class:alttab"
    )
  )
end)
