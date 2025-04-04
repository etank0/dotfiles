return {
    "kaicataldo/material.vim",
    lazy = false,
    name = "material",
    priority = 1000,
    config = function()
        vim.o.termguicolors = true
        vim.g.material_theme_style = "darker"
        vim.g.material_terminal_italics = 1
        vim.cmd.colorscheme("material")

        -- Set up global highlights for floating windows to improve aesthetics
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "NONE" })

        -- To change the separator color
        vim.cmd([[highlight WinSeparator guifg=#545454]])
        vim.cmd([[highlight Virtcolumn guifg=#545454]])
    end,
}
