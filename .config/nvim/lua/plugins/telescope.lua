return {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set(
      "n",
      "<leader>ff",
      builtin.find_files,
      { desc = "find files" }
    )
    vim.keymap.set(
      "n",
      "<leader>fg",
      builtin.live_grep,
      { desc = "find grep(search)" }
    )
    vim.keymap.set(
      "v",
      "<leader>fg",
      "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
      { noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>fb",
      builtin.buffers,
      { desc = "find buffers" }
    )
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "find help" })
    vim.keymap.set(
      "n",
      "<leader>fs",
      builtin.lsp_document_symbols,
      { desc = "find symbols" }
    )
    vim.keymap.set(
      "n",
      "<leader>\\",
      builtin.oldfiles,
      { desc = "find old files global" }
    )
    vim.keymap.set("n", "<leader>fo", function()
      builtin.oldfiles({
        cwd_only = true, -- Filters to show only files from the current workspace (CWD)
      })
    end, { desc = "find old files in the workspace" })
    vim.keymap.set(
      "n",
      "<leader>fw",
      builtin.grep_string,
      { desc = "find word under cursor" }
    )
    vim.keymap.set(
      "n",
      "<leader>fk",
      builtin.keymaps,
      { desc = "find keymaps" }
    )
    -- vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { silent = true, noremap = true })
    vim.keymap.set(
      "n",
      "<leader>gb",
      builtin.git_branches,
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>dl", function()
      builtin.diagnostics({ bufnr = 0 })
    end, { desc = "For diagnostics list" })
    vim.keymap.set("n", "<leader>cd", function()
      vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end, { desc = "show line diagnostics" })
  end,
}
