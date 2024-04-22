------------------------------------------------
-- COLORSCHEMES
-------------------------------------------------
-- local ok, _ = pcall(vim.cmd, 'colorscheme wal')
-- local _ = pcall(vim.cmd, 'colorscheme pywal')

local g = vim.g
local o = vim.o
o.termguicolors = true
g.material_theme_style = 'darker'
local _ = pcall(vim.cmd, 'colorscheme material')
----------------FOR PYWAL.NVIM EXTENSION------------------
-- vim.cmd([[highlight EndOfBuffer ctermfg=0 ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight NormalNC ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight SignColumn ctermfg=NONE ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight Pmenu ctermfg=NONE ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight FloatBorder ctermfg=NONE ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight NormalFloat ctermfg=NONE ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight TabLine ctermfg=NONE ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight LineNR ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])
-- vim.cmd([[highlight NonText ctermbg=NONE guibg=NONE]])
-------------------------------------------------------------------
--vim.cmd([[highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE]])
--vim.cmd([[highlight CursorLineNR cterm=Bold ctermfg=15 ctermbg=NONE]])
