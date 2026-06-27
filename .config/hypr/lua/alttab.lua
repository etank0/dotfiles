---@class AltTab
---@field alttab_dir string
---@field preview_png string
---@field filter_classes string[]
local M = {}

local config = os.getenv("HOME") .. "/.config/hypr/"
local scripts = config .. "scripts/alttab/"

M.alttab_dir = os.getenv("XDG_RUNTIME_DIR") .. "/hypr/alttab/"
M.preview_png = M.alttab_dir .. "preview.png"
M.filter_classes = { "Dofus.x64" }

local input = M.alttab_dir .. "input"
local sel = M.alttab_dir .. "address"

local function ensure_dir()
  os.execute(("mkdir -p %q"):format(M.alttab_dir))
end

---@param class string
---@return boolean
local function should_filter(class)
  for _, c in ipairs(M.filter_classes) do
    if c == class then
      return true
    end
  end
  return false
end

---@param windows table
local function write_input(windows)
  local f = assert(io.open(input, "w"))

  for _, w in ipairs(windows) do
    if w.workspace.id >= 0 then
      f:write(w.address, "\t", w.title, "\n")
    end
  end

  f:close()
end

---@param mods string
---@param key string
local function send(mods, key)
  return hl.dsp.send_shortcut({
    mods = mods,
    key = key,
    window = "class:alttab",
  })
end

---@param direction "up"|"down"
function M:alttab(direction)
  local prev_submap = hl.get_current_submap()
  if prev_submap == "alttab" then
    return
  end

  if prev_submap == "" then
    prev_submap = "reset"
  end

  ensure_dir()

  local active = hl.get_active_window()
  local windows

  if active and should_filter(active.class) then
    windows = hl.get_windows({ class = active.class })
  else
    windows = hl.get_windows()
  end

  table.sort(windows, function(a, b)
    return a.focus_history_id < b.focus_history_id
  end)

  write_input(windows)
  os.remove(sel)

  hl.config({
    animations = {
      enabled = false,
    },
  })

  hl.dispatch(hl.dsp.submap("alttab"))

  hl.exec_cmd(
    string.format(
      "bash %salt-tab.sh '%s' '%s' '%s' '%s'",
      scripts,
      direction,
      input,
      sel,
      prev_submap
    )
  )
end

hl.bind("ALT + TAB", function()
  M:alttab("down")
end)

hl.bind("ALT + SHIFT + TAB", function()
  M:alttab("up")
end)

hl.define_submap("alttab", function()
  hl.bind("ALT + TAB", send("", "tab"))
  hl.bind("ALT + SHIFT + TAB", send("SHIFT", "tab"))

  hl.bind("ALT + ALT_L", send("", "return"), { release = true })
  hl.bind("ALT + SHIFT + ALT_L", send("", "return"), { release = true })

  -- Cancel
  hl.bind("escape", send("", "escape"))
  hl.bind("SHIFT + escape", send("SHIFT", "escape"))
end)
