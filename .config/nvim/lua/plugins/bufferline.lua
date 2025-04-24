return {
  "akinsho/bufferline.nvim",
  config = function()
    local status, bufferline = pcall(require, "bufferline")
    if not status then
      print("ERROR bufferline")
      return
    end

    bufferline.setup({
      options = {
        diagnostics = "nvim_lsp",
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer", -- Text shown in the offset
            text_align = "center", -- Align text (left, center, or right)
            separator = "▏", -- Whether to show a separator
          },
        },
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --     local s = " "
        --     for e, n in pairs(diagnostics_dict) do
        --         local sym = (e == "error" and " ")
        --             or (e == "warning" and " ")
        --             or " "
        --         s = s .. n .. sym
        --     end
        --     return s
        -- end,
      },
      highlights = {
        buffer_selected = { bold = true, italic = false },
        diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        pick = { italic = false },
        fill = {
          -- For Material Darker
          -- fg = "#212121",
          -- bg = "#212121",

          -- For Gruvbox
          -- fg = "#1d2021",
          -- bg = "#1d2021",
        },
        offset_separator = {
          -- For Material Darker
          -- fg = "#343434",
          -- bg = "#212121",

          -- For Gruvbox
          -- fg = "#665c54",
          -- bg = "#1d2021",
        },
      },
    })
  end,
}
