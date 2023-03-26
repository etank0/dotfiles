vim.cmd [[highlight IndentBlanklineIndent1 ctermfg=8]]
vim.opt.list = true

require('indent_blankline').setup {
  char_highlight_list = {
        "IndentBlanklineIndent1",
	},
  show_end_of_line = true,
  show_trailing_blankline_indent = false,
}

