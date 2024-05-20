-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

local function map(m, k, v)
	 vim.api.nvim_set_keymap(m, k, v, { silent = true })
end


map("n", "<C-b>", "<CMD>NvimTreeToggle<CR>")

--Resizing
map("n", "<C-Up>", ":resize -1<CR>")
map("n", "<C-Down>", ":resize +1<CR>")
map("n", "<C-Left>", ":vertical resize -1<CR>")
map("n", "<C-Right>", ":vertical resize +1<CR>")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

--Fuzzy

map("n", "<C-h>", ":History<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader= " "
