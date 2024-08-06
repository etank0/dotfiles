return {
    "kaicataldo/material.vim",
    lazy = false,
    name = "material",
    priority = 1000,
    config = function()
        vim.o.termguicolors = true
        vim.g.material_theme_style = "darker"
        vim.cmd.colorscheme("material")
    end,
}
