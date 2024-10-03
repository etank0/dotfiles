return {
	"nvim-lualine/lualine.nvim",
    priority = 1000,
    config = function()
        require("lualine").setup({
            options = {
                theme = require('material.lualine'),
                component_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
        })
    end
}
