-- local g = vim.g
local o = vim.o

vim.cmd("syntax on")

-- ## Better editor UI
o.cursorline = true
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = 'yes'
-- o.termguicolors = true
o.scrolloff = 8
o.showmatch = true
o.matchtime = 2

-- ## Better editing experience
o.smarttab = true
o.expandtab = true
o.tabstop = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.shiftwidth = 4
o.laststatus = 2
o.cindent = true
o.autoindent = true
o.wrap = true
o.list = true
o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
-- o.formatoptions = 'qrn1'

-- ## Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- ## Better buffer splitting
o.splitright = true
o.splitbelow = true

-- ## Better searching
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

-- ## Remove '~'
o.fillchars = "eob: ,vert:│"
o.mouse = "a"

-- ## Cursor Settings
-- o.guicursor = "n-v-c:block-blinkwait300-blinkon200-blinkoff150"
o.guicursor = ""

