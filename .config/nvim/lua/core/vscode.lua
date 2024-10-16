-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
local vscode = require("vscode")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

----------------- Builtin VsCode ------------------
-- -- Files
-- vim.keymap.set({'n', 'v'}, "<leader>ff", ":call VSCodeNotify('workbench.action.quickOpen')<CR>");
--
-- -- Live Grep
-- vim.keymap.set({'n', 'v'}, "<leader>fg", ":call VSCodeNotify('workbench.action.findInFiles')<CR>");

--- Find it Faster ---

-- Find Files
-- vim.keymap.set({ "n", "v" }, "<leader>ff", ":call VSCodeNotify('find-it-faster.findFiles')<CR>")
vim.keymap.set({ "n", "v" }, "<leader>ff", function()
    vscode.action("find-it-faster.findFiles")
end)

-- -- Live Grep
-- vim.keymap.set("n", "<leader>fg", ":call VSCodeNotify('find-it-faster.findWithinFiles')<CR>")
vim.keymap.set({ "n", "v" }, "<leader>fg", function()
    vscode.action("find-it-faster.findWithinFiles")
end)

-- Match Tags
-- vim.keymap.set("n", "<leader>m", ":call VSCodeNotify('editor.emmet.action.matchTag')<CR>")
vim.keymap.set("n", "<leader>m", function()
    vscode.action("editor.emmet.action.matchTag")
end)

-- Git stuff
-- vim.keymap.set("n", "<leader>gs", ":call VSCodeNotify('workbench.view.scm')<CR>")
vim.keymap.set("n", "<leader>gs", function()
    vscode.action("workbench.view.scm")
end)
-- vim.keymap.set("n", "<leader>tb", ":call VSCodeNotify('gitlens.toggleLineBlame')<CR>")
vim.keymap.set("n", "<leader>tb", function()
    vscode.action("gitlens.toggleLineBlame")
end)
-- vim.keymap.set("n", "<leader>tB", ":call VSCodeNotify('gitlens.toggleFileBlame')<CR>")
vim.keymap.set("n", "<leader>tB", function()
    vscode.action("gitlens.toggleFileBlame")
end)

-- Formatting
-- vim.keymap.set("n", "<leader>lf", "<C-S-i>")
-- vim.keymap.set("n", "<leader>lf", ":call VSCodeNotify('editor.action.formatDocument')<CR>")
-- vim.keymap.set("v", "<leader>lf", ":call VSCodeNotify('editor.action.formatSelection')<CR>")
vim.keymap.set("n", "<leader>lf", function()
    vscode.action("editor.action.formatDocument")
end)

vim.keymap.set("v", "<leader>lf", function()
    vscode.action("editor.action.formatSelection")
end)

----------------- Native Neovim ------------------
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

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Buffer Manipulations

vim.keymap.set("n", "<S-l>", ":Tabnext<CR>")
vim.keymap.set("n", "<S-h>", ":Tabprevious<CR>")
-- vim.keymap.set("n", "<S-h>", ":bp<CR>")
-- vim.keymap.set("n", "<S-l>", ":bn<CR>")

-- Diagnostic
vim.keymap.set("n", "<leader>dh", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)

-- Scroll [ Note: Not working :( ]
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-f>", "<C-f>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
