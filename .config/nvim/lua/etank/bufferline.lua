local status, bufferline = pcall(require, "bufferline")
if not status then
    print("ERROR bufferline")
    return
end

bufferline.setup({
    options = {
        separator_style = { '', '' },
    },
    highlights = {
        buffer_selected = { bold = true, italic = false },
        diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        pick = { italic = false },
<<<<<<< HEAD
        fill = {
            fg = "#212121",
            bg = "#212121"
        }
=======
        indicator_selected = {
            fg = { attribute= "bg", highlight = "Normal" },
        },
        separator = {
            fg = "#181818",
            bg = { attribute = "bg", highlight = "Normal" },
        },
        separator_selected = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = "#181818",
        },
        tab_separator = {
            fg = "#181818",
            bg = "#181818",
        },
        tab_separator_selected = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
>>>>>>> parent of de69979 (added nchat config :speech_balloon:)
    },
})
