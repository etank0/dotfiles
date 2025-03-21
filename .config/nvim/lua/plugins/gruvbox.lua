-- Default options:
return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.o.background = "dark"
        require("gruvbox").setup({
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,    -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = false,
            transparent_mode = true,
        })
        vim.cmd.colorscheme("gruvbox")
        vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#1d2021", fg = "#1d2021" })
        -- vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineBuffer", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineCloseButton", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineWarning", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineWarningVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineWarningDiagnostic", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineWarningDiagnosticVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineDiagnostic", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineDiagnosticVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineHint", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineHintVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineHintDiagnostic", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineHintDiagnosticVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineInfo", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineInfoVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineInfoDiagnostic", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineInfoDiagnosticVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "#17191a", fg = "#1d2021" })
        -- vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { bg = "#17191a", fg = "#1d2021" })
        -- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineTruncMarker", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLinePick", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLinePickVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineModified", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineDuplicate", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineDuplicateVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineError", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineErrorVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineErrorDiagnostic", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineErrorDiagnosticVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineNumbers", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineNumbersVisible", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineFileIcon", { bg = "#17191a" })
        -- vim.api.nvim_set_hl(0, "BufferLineFileIconVisible", { bg = "#17191a" })
        vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", { bg = "#1d2021", fg = "#665c54" })
        vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = "#fabd2f" })
    end
}
