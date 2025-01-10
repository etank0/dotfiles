local g = vim.g
local o = vim.o

vim.cmd("syntax on")
-- Better editor UI
o.number = true
--o.cursorline = true
o.numberwidth = 5
o.relativenumber = true
--o.signcolumn = 'yes'
--o.termguicolors = true
o.scrolloff = 8
-- Better editing experience
o.smarttab = true
o.cindent = true
o.expandtab = true
o.laststatus = 2
o.autoindent = true
o.wrap = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
-- o.formatoptions = 'qrn1'
-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"
-- Better buffer splitting
o.splitright = true
o.splitbelow = true
--searching
o.hlsearch = false
o.incsearch = true
-- remove '~'
o.fillchars = "eob: ,vert:▏"
o.mouse = "a"
