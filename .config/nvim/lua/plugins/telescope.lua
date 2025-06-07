return {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local map = require("utils.map")
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        border = {
          prompt = { 1, 1, 1, 1 },
          results = { 1, 1, 1, 1 },
          preview = { 1, 1, 1, 1 },
        },
        borderchars = {
          prompt = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
          results = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
      },
    })

    -- File Operations
    map(
      "n",
      "<leader>ff",
      builtin.find_files,
      { desc = "Find files in workspace" }
    )
    map(
      "n",
      "<leader>\\",
      builtin.oldfiles,
      { desc = "Find recently opened files" }
    )
    map("n", "<leader>fo", function()
      builtin.oldfiles({ cwd_only = true })
    end, { desc = "Find recent files in current workspace" })

    -- Search Operations
    map(
      "n",
      "<leader>fg",
      builtin.live_grep,
      { desc = "Live grep in workspace" }
    )
    map(
      "v",
      "<leader>fg",
      "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>",
      { desc = "Search for selected text" }
    )
    map(
      "n",
      "<leader>fw",
      builtin.grep_string,
      { desc = "Find word under cursor in workspace" }
    )

    -- Buffer/Help Operations
    map("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
    map("n", "<leader>fk", builtin.keymaps, { desc = "Find available keymaps" })

    -- LSP Operations
    map(
      "n",
      "<leader>fs",
      builtin.lsp_document_symbols,
      { desc = "Find document symbols" }
    )
    map("n", "<leader>dl", function()
      builtin.diagnostics({ bufnr = 0 })
    end, { desc = "Show buffer diagnostics" })

    -- Git Operations
    map("n", "<leader>gb", builtin.git_branches, { desc = "Find git branches" })
  end,
}
