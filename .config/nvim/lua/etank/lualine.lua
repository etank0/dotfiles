local lualine = require('lualine')

lualine.setup {
  options = {
    theme = require('material.lualine'),
	component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
}
