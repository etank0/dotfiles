-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(m, k, v)
    vim.api.nvim_set_keymap(m, k, v, { silent = true })
end

-- Nvim Tree Toggle
vim.api.nvim_set_keymap("n", "<C-b>", "<C-e>", { noremap = true, silent = true })
map("n", "<C-e>", ":NvimTreeToggle<CR>")

-- Window Manipulations
map("n", "<C-Up>", ":resize -1<CR>")
map("n", "<C-Down>", ":resize +1<CR>")
map("n", "<C-Left>", ":vertical resize -1<CR>")
map("n", "<C-Right>", ":vertical resize +1<CR>")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>v", "<C-w>v")
map("n", "<leader>s", "<C-w>s")
map("n", "<leader>w", "<C-w>w")
map("n", "<leader>dd", "<C-w>q")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Buffer Manipulations
map("n", "<S-h>", ":bp<CR>")
map("n", "<S-l>", ":bn<CR>")
map("n", "<leader>bd", ":bd<CR>")
map("n", "<leader>bw", ":bw<CR>")

-- Fuzzy
map("n", "<leader><Bslash>", ":History<CR>")

-- Diagnostic
vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
