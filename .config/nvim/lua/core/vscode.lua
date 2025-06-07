-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------
local map = require("utils.map")
local vscode = require("vscode")
vim.notify = vscode.notify

-- Leader key setup
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------------------
-- VSCODE COMMANDS
-------------------------------------------------

-- File Operations
map({ "n", "v" }, "<leader>ff", function()
  vscode.action("find-it-faster.findFiles")
end, { desc = "Find files" })

map({ "n", "v" }, "<leader>fg", function()
  vscode.action("find-it-faster.findWithinFiles")
end, { desc = "Live grep" })

map("n", "<leader>ft", function()
  vscode.action("find-it-faster.findWithinFilesWithType")
end, { desc = "Find by file type" })

map({ "n", "v" }, "<leader>fo", function()
  vscode.action("workbench.action.quickOpen")
end, { desc = "Recent files" })

map({ "n", "v" }, "<leader>fb", function()
  vscode.action("workbench.action.showAllEditorsByMostRecentlyUsed")
end, { desc = "Open buffers" })

-- Diagnostics
map("n", "<leader>dl", function()
  vscode.action("workbench.actions.view.problems")
end, { desc = "Diagnostics list" })

-- Editor Actions
map("n", "<leader>m", function()
  vscode.action("editor.emmet.action.matchTag")
end, { desc = "Match HTML tag" })

-------------------------------------------------
-- GIT INTEGRATION
-------------------------------------------------
map("n", "<leader>gs", function()
  vscode.action("workbench.view.scm")
end, { desc = "Git status" })

map("n", "<leader>tb", function()
  vscode.action("gitlens.toggleLineBlame")
end, { desc = "Toggle line blame" })

map("n", "<leader>tB", function()
  vscode.action("gitlens.toggleFileBlame")
end, { desc = "Toggle file blame" })

-------------------------------------------------
-- FORMATTING
-------------------------------------------------
map("n", "<leader>lf", function()
  vscode.action("editor.action.formatDocument")
end, { desc = "Format document" })

map("v", "<leader>lf", function()
  vscode.action("editor.action.formatSelection")
end, { desc = "Format selection" })

-------------------------------------------------
-- WINDOW MANAGEMENT
-------------------------------------------------

-- Reload Window
map("n", "<A-w>", function()
  vscode.action("workbench.action.reloadWindow")
end, { desc = "Reload window" })

-- Toggle Panel
map("n", "<C-S-j>", function()
  vscode.action("workbench.action.togglePanel")
end, { desc = "Toggle panel" })

-- Toggle tab bar
map("n", "<leader>bb", function()
  local current = vscode.get_config("workbench.editor.showTabs")
  local new_value = (current == "multiple") and "none" or "multiple"
  vscode.update_config("workbench.editor.showTabs", new_value, "global")
end, { desc = "Toggle tab bar" })

-- Navigation
map("n", "<leader>h", function()
  vscode.action("workbench.action.navigateLeft")
end, { desc = "Move focus left" })

map("n", "<leader>j", function()
  vscode.action("workbench.action.navigateDown")
end, { desc = "Move focus down" })

map("n", "<leader>k", function()
  vscode.action("workbench.action.navigateUp")
end, { desc = "Move focus up" })

map("n", "<leader>l", function()
  vscode.action("workbench.action.navigateRight")
end, { desc = "Move focus right" })

-- Splits
map("n", "<leader>v", function()
  vscode.action("workbench.action.splitEditorRight")
end, { desc = "Vertical split" })

map("n", "<leader>s", function()
  vscode.action("workbench.action.splitEditorDown")
end, { desc = "Horizontal split" })

map("n", "<leader>o", function()
  vscode.action("workbench.action.joinAllGroups")
end, { desc = "Close other splits" })

-- Focus
map("n", "<leader>fp", function()
  vscode.action("workbench.action.switchWindow")
end, { desc = "Focus window picker" })

map("n", "<leader>w", function()
  vscode.action("workbench.action.focusNextGroup")
end, { desc = "Focus next group" })

map("n", "<leader>p", function()
  vscode.action("workbench.action.focusPreviousGroup")
end, { desc = "Focus previous group" })

-- Closing
map("n", "<leader>dd", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close active editor" })

map("n", "<leader>q", function()
  vscode.action("workbench.action.closeActiveEditor")
end, { desc = "Close active editor" })

-------------------------------------------------
-- LSP AND DIAGNOSTICS
-------------------------------------------------
map("n", "<leader>cd", function()
  vscode.action("editor.action.showHover")
end, { desc = "Show hover" })

map("n", "<leader>tv", function()
  vscode.action("errorLens.toggle")
end, { desc = "Toggle error lens" })

map("n", "<leader>dh", vim.diagnostic.open_float, { desc = "Show diagnostics" })
map("n", "]d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "[d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map(
  { "n", "v" },
  "<leader>ca",
  vim.lsp.buf.code_action,
  { desc = "Code actions" }
)

-------------------------------------------------
-- BUFFER NAVIGATION
-------------------------------------------------
map("n", "<S-l>", ":Tabnext<CR>", { desc = "Next tab" })
map("n", "<S-h>", ":Tabprevious<CR>", { desc = "Previous tab" })
map({ "n", "v" }, "<leader><tab>", function()
  vscode.action("workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup")
end, { desc = "Switch to last buffer" })

-------------------------------------------------
-- VIEW MANAGEMENT
-------------------------------------------------

-- Resizing
map("n", "<C-Up>", function()
  vscode.action("workbench.action.decreaseViewHeight")
end, { desc = "Decrease height" })

map("n", "<C-Down>", function()
  vscode.action("workbench.action.increaseViewHeight")
end, { desc = "Increase height" })

map("n", "<C-Left>", function()
  vscode.action("workbench.action.decreaseViewWidth")
end, { desc = "Decrease width" })

map("n", "<C-Right>", function()
  vscode.action("workbench.action.increaseViewWidth")
end, { desc = "Increase width" })

-- Layout
map("n", "<leader>=", function()
  vscode.action("workbench.action.evenEditorWidths")
end, { desc = "Even editor widths" })

map("n", "<leader>-", function()
  vscode.action("workbench.action.toggleEditorWidths")
end, { desc = "Toggle editor width" })
