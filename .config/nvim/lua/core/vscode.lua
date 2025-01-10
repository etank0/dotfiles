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
vim.keymap.set({ "n", "v" }, "<leader>ff", function() vscode.action("find-it-faster.findFiles") end)

-- -- Live Grep
-- vim.keymap.set("n", "<leader>fg", ":call VSCodeNotify('find-it-faster.findWithinFiles')<CR>")
vim.keymap.set({ "n", "v" }, "<leader>fg", function() vscode.action("find-it-faster.findWithinFiles") end)

-- Find Open Buffers
vim.keymap.set({ "n", "v" }, "<leader>fb", function() vscode.action("workbench.action.showAllEditorsByMostRecentlyUsed") end)

-- Find Recently Opened buffers in the project/directory
vim.keymap.set({ "n", "v" }, "<leader>fo", function() vscode.action("workbench.action.quickOpen") end)

-- Match Tags
-- vim.keymap.set("n", "<leader>m", ":call VSCodeNotify('editor.emmet.action.matchTag')<CR>")
vim.keymap.set("n", "<leader>m", function() vscode.action("editor.emmet.action.matchTag") end)

-- Git stuff
-- vim.keymap.set("n", "<leader>gs", ":call VSCodeNotify('workbench.view.scm')<CR>")
vim.keymap.set("n", "<leader>gs", function() vscode.action("workbench.view.scm") end)

-- vim.keymap.set("n", "<leader>tb", ":call VSCodeNotify('gitlens.toggleLineBlame')<CR>")
vim.keymap.set("n", "<leader>tb", function() vscode.action("gitlens.toggleLineBlame") end)

-- vim.keymap.set("n", "<leader>tB", ":call VSCodeNotify('gitlens.toggleFileBlame')<CR>")
vim.keymap.set("n", "<leader>tB", function() vscode.action("gitlens.toggleFileBlame") end)

-- Formatting
-- vim.keymap.set("n", "<leader>lf", "<C-S-i>")
-- vim.keymap.set("n", "<leader>lf", ":call VSCodeNotify('editor.action.formatDocument')<CR>")
-- vim.keymap.set("v", "<leader>lf", ":call VSCodeNotify('editor.action.formatSelection')<CR>")
vim.keymap.set("n", "<leader>lf", function() vscode.action("editor.action.formatDocument") end)
vim.keymap.set("v", "<leader>lf", function() vscode.action("editor.action.formatSelection") end)

-- Switching Tabs
vim.keymap.set({ "n", "v" }, "<leader><tab>", function()
    vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
end)

-- Resize commands
vim.keymap.set("n", "<C-Up>", function() vscode.action("workbench.action.decreaseViewHeight") end)
vim.keymap.set("n", "<C-Down>", function() vscode.action("workbench.action.increaseViewHeight") end)
vim.keymap.set("n", "<C-Left>", function() vscode.action("workbench.action.decreaseViewHeight") end)
vim.keymap.set("n", "<C-Right>", function() vscode.action("workbench.action.increaseViewHeight") end)
vim.keymap.set("n", "<leader>=", function() vscode.action("workbench.action.evenEditorWidths") end)
vim.keymap.set("n", "<leader>-", function() vscode.action("workbench.action.toggleEditorWidths") end)

-- Navigation commands
vim.keymap.set("n", "<leader>h", function() vscode.action("workbench.action.navigateLeft") end)
vim.keymap.set("n", "<leader>j", function() vscode.action("workbench.action.navigateDown") end)
vim.keymap.set("n", "<leader>k", function() vscode.action("workbench.action.navigateUp") end)
vim.keymap.set("n", "<leader>l", function() vscode.action("workbench.action.navigateRight") end)

-- Split commands
vim.keymap.set("n", "<leader>v", function() vscode.action("workbench.action.splitEditorRight") end)
vim.keymap.set("n", "<leader>s", function() vscode.action("workbench.action.splitEditorDown") end)
vim.keymap.set("n", "<leader>o", function() vscode.action("workbench.action.joinAllGroups") end)

-- Window focus command
vim.keymap.set("n", "<leader>w", function() vscode.action("workbench.action.focusNextGroup") end)
vim.keymap.set("n", "<leader>p", function() vscode.action("workbench.action.focusPreviousGroup") end)

-- Close Window/Tab
vim.keymap.set("n", "<leader>dd", function() vscode.action('workbench.action.closeActiveEditor') end)
vim.keymap.set("n", "<leader>q", function() vscode.action('workbench.action.closeActiveEditor') end)

----------------- Native Neovim ------------------
-- Buffer Manipulations
vim.keymap.set("n", "<S-l>", ":Tabnext<CR>")
vim.keymap.set("n", "<S-h>", ":Tabprevious<CR>")
-- vim.keymap.set("n", "<S-h>", ":bp<CR>")
-- vim.keymap.set("n", "<S-l>", ":bn<CR>")

-- Diagnostic
vim.keymap.set("n", "<leader>dh", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)

-- Lsp
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)

-- Scroll [ Note: Not working :( ]
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-f>", "<C-f>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
