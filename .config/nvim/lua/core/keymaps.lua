-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(m, k, v)
    vim.api.nvim_set_keymap(m, k, v, { silent = true })
end

-- Nvim/Neo Tree Toggle
vim.api.nvim_set_keymap("n", "<C-b>", "<C-e>", { noremap = true, silent = true })
map("n", "<C-e>", ":Neotree toggle<CR>")

-- Window Manipulations
map("n", "<C-Up>", ":resize -1<CR>")
map("n", "<C-Down>", ":resize +1<CR>")
map("n", "<C-Left>", ":vertical resize -1<CR>")
map("n", "<C-Right>", ":vertical resize +1<CR>")
map("n", "<leader>=", "<C-w>=")
map("n", "<leader>-", "<C-w>_")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>v", "<C-w>v")
map("n", "<leader>s", "<C-w>s")
map("n", "<leader>o", "<C-w>o")
map("n", "<leader>w", "<C-w>w")
map("n", "<leader>p", "<C-w>p")
map("n", "<leader>dd", "<C-w>q")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Buffer Manipulations
map("n", "<S-h>", ":bp<CR>")
map("n", "<S-l>", ":bn<CR>")
map('n', '<leader>q', ':bnext | bd#<CR>')
map("n", "<leader>bd", ":bd<CR>")
map("n", "<leader>bw", ":bw<CR>")
map('n', '<leader><tab>', ':b#<CR>')

-- Format
-- map("n", "<C-S-i>", "<leader>lf")

-- Diagnostic
vim.keymap.set("n", "<leader>dh", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)

-- Scroll
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-f>", "<C-f>zz")
map("n", "<C-u>", "<C-u>zz")

-- autosave
-- vim.api.nvim_create_augroup("autosave", { clear = true })
-- vim.api.nvim_create_autocmd({"BufLeave", "BufWinLeave", "FocusLost"}, {
--     group = "autosave",
--     pattern = "*",
--     callback = function()
--         vim.cmd("silent! wall")
--     end,
-- })
