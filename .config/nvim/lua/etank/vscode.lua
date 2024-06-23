-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
local vscode = require("vscode")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Files
vim.keymap.set({'n', 'v'}, "<leader>ff", ":call VSCodeNotify('workbench.action.quickOpen')<CR>");

-- Window Manipulations
vim.keymap.set("n", "<C-Up>", ":resize -1<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +1<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -1<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +1<CR>")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>s", "<C-w>s")
vim.keymap.set("n", "<leader>w", "<C-w>w")
vim.keymap.set("n", "<leader>dd", "<C-w>q")

-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Buffer Manipulations

vim.keymap.set("n", "<S-l>", ":Tabnext<CR>")
vim.keymap.set("n", "<S-h>", ":Tabprevious<CR>")
-- vim.keymap.set("n", "<S-h>", ":bp<CR>")
-- vim.keymap.set("n", "<S-l>", ":bn<CR>")

-- Diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
