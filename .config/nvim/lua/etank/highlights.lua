-------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-monokai')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-nord')
-- local ok, _ = pcall(vim.cmd, 'colorscheme base16-oceanicnext')
local ok, _ = pcall(vim.cmd, 'colorscheme wal')

vim.cmd([[highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE]])
vim.cmd([[highlight CursorLineNR cterm=Bold ctermfg=15 ctermbg=NONE]])
