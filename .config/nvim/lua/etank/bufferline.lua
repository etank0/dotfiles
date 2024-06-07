local status, bufferline = pcall(require, "bufferline")
if not status then
  print("ERROR bufferline")
  return
end

bufferline.setup({
    options = {
        separator_style = "thick",
    },
    highlights = {
        buffer_selected = { bold = true, italic = false },
        diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        pick = { italic = false },
        fill = {
            fg="#212121",
            bg="#212121"
        }
    },
})

