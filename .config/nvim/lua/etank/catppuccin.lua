local catppuccin = require("catppuccin")
catppuccin.setup {
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = true,
	color_overrides = {
        all = {
            text = "#ffffff",
        },
		mocha = {
			base = "#000000",
			mantle = "#000000",
			crust = "#000000",
		},
	}
}
vim.cmd.colorscheme "catppuccin"
