-------------------------------------------------
-- NETRW
-------------------------------------------------

require("extras.netrw")

-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
-- Set space as the global leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = require("utils.map")

-------------------------------------------------
-- NAVIGATION
-------------------------------------------------

-- Window navigation
map("n", "<leader>h", "<C-w>h", { desc = "Move to left window" })
map("n", "<leader>j", "<C-w>j", { desc = "Move to window below" })
map("n", "<leader>k", "<C-w>k", { desc = "Move to window above" })
map("n", "<leader>l", "<C-w>l", { desc = "Move to right window" })
map("n", "<leader>w", "<C-w>w", { desc = "Cycle through windows" })
map("n", "<leader>p", "<C-w>p", { desc = "Go to previous window" })
map("n", "<leader>z", "<C-w>z", { desc = "Close tag preview window" })

-- Buffer navigation
map("n", "<S-h>", ":bp<CR>", { desc = "Previous buffer" })
map("n", "<S-l>", ":bn<CR>", { desc = "Next buffer" })
map("n", "<leader><tab>", ":b#<CR>", { desc = "Switch to last buffer" })

-------------------------------------------------
-- WINDOW MANAGEMENT
-------------------------------------------------

-- Window resizing
map(
  "n",
  "<C-Up>",
  "<C-w>-",
  { desc = "Decrease window height (push bottom up)" }
)
map(
  "n",
  "<C-Down>",
  "<C-w>+",
  { desc = "Increase window height (push bottom down)" }
)
map(
  "n",
  "<C-Left>",
  "<C-w><",
  { desc = "Decrease window width (push right border left)" }
)
map(
  "n",
  "<C-Right>",
  "<C-w>>",
  { desc = "Increase window width (push right border right)" }
)

-- Window layout
map("n", "<leader>=", "<C-w>=", { desc = "Equalize window sizes" })
map("n", "<leader>-", "<C-w>_", { desc = "Maximize window height" })
map("n", "<leader>v", "<C-w>v", { desc = "Vertical split" })
map("n", "<leader>s", "<C-w>s", { desc = "Horizontal split" })
map("n", "<leader>o", "<C-w>o", { desc = "Close other windows" })

-------------------------------------------------
-- BUFFER MANAGEMENT
-------------------------------------------------

map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
map("n", "<leader>bw", ":bw<CR>", { desc = "Wipe buffer" })
map("n", "<leader>q", function()
  if vim.fn.winnr("$") > 1 then
    vim.cmd("close")
  else
    vim.cmd("bnext | bd#")
  end
end, { desc = "Close window or delete buffer" })

-------------------------------------------------
-- TEXT MANIPULATION
-------------------------------------------------

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-------------------------------------------------
-- DIAGNOSTICS
-------------------------------------------------

map("n", "<leader>cd", function()
  vim.diagnostic.open_float(nil, { focusable = false, border = "single" })
end, { desc = "Show line diagnostics" })
map(
  "n",
  "<leader>dh",
  vim.diagnostic.open_float,
  { desc = "Show diagnostics hover" }
)
map("n", "]d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "[d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-------------------------------------------------
-- SCROLLING
-------------------------------------------------

-- Center screen when scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down centered" })
map("n", "<C-f>", "<C-f>zz", { desc = "Scroll forward centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up centered" })
map("n", "<C-a>", "<C-e>", { desc = "Scroll down inplace" })

-------------------------------------------------
-- QUICKFIX LIST
-------------------------------------------------

map("n", "<M-j>", ":cnext<CR>", { desc = "Next quickfix item" })
map("n", "<M-k>", ":cprev<CR>", { desc = "Previous quickfix item" })

-------------------------------------------------
-- TABLINE
-------------------------------------------------

map("n", "<leader>bb", function()
  vim.o.showtabline = vim.o.showtabline == 0 and 2 or 0
end, { desc = "Toggle Bufferline" })

-------------------------------------------------
-- AUTO-SAVE (commented out by default)
-------------------------------------------------

-- vim.api.nvim_create_augroup("autosave", { clear = true })
-- vim.api.nvim_create_autocmd({"BufLeave", "BufWinLeave", "FocusLost"}, {
--     group = "autosave",
--     pattern = "*",
--     callback = function()
--         vim.cmd("silent! wall")
--     end,
--     desc = "Auto-save on focus loss"
-- })
