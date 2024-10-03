return {
    "kaicataldo/material.vim",
    lazy = false,
    name = "material",
    priority = 1000,
    config = function()
        vim.o.termguicolors = true
        vim.g.material_theme_style = "darker"
        vim.cmd.colorscheme("material")

        -- Set up global highlights for floating windows to improve aesthetics
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "NONE" })
    end,
}
