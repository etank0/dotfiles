return {
	"catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")
        catppuccin.setup {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            transparent_background = true,
            color_overrides = {
                -- all = {
                --     text = "#ffffff",
                -- },
                mocha = {
                    base = "#101010",
                    mantle = "#111111",
                    crust = "#121212",
                },
            },
            integrations = {
                treesitter = true,
                nvimtree = {
                    enabled = true,
                    show_root = false,
                    transparent_panel = false,
                },
            },
        }
        vim.cmd.colorscheme "catppuccin"
    end
}

