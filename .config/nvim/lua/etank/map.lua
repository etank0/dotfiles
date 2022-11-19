-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

local function map(m, k, v)
	vim.api.nvim_set_keymap(m, k, v, { silent = true })
end


map("n", "<C-b>", "<CMD>NERDTreeToggle<CR>")

--Resizing
map("n", "<C-Up>", ":resize -1<CR>")
map("n", "<C-Down>", ":resize +1<CR>")
map("n", "<C-Left>", ":vertical resize -1<CR>")
map("n", "<C-Right>", ":vertical resize +1<CR>")

--Fuzzy

map("n", "<C-t>", ":History<CR>")
