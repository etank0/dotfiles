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
                separator_style = "thick",
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
                    fg = "#212121",
                    bg = "#212121",
                },
            },
        })

    end,
}
