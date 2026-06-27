local function sorted_windows()
  local windows = hl.get_windows()

  table.sort(windows, function(a, b)
    return a.focus_history_id < b.focus_history_id
  end)

  return windows
end

local function focus_relative(dir)
  local windows = sorted_windows()
  local active = hl.get_active_window()

  if not active or #windows == 0 then
    return
  end

  local idx = 1

  for i, w in ipairs(windows) do
    if w.address == active.address then
      idx = i
      break
    end
  end

  if dir == "next" then
    idx = idx + 1
    if idx > #windows then
      idx = 1
    end
  else
    idx = idx - 1
    if idx < 1 then
      idx = #windows
    end
  end

  local target = windows[idx]
  if not target then
    return
  end

  hl.dispatch(hl.dsp.focus({ window = "address:" .. target.address }))
end

hl.bind("ALT + TAB", function()
  focus_relative("next")
end)

hl.bind("ALT + SHIFT + TAB", function()
  focus_relative("prev")
end)
