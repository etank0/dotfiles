return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "tpope/vim-fugitive" },
  config = function()
    local map = require("utils.map")
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      on_attach = function(bufnr)
        -- Buffer-local mappings with descriptions
        local opts = { buffer = bufnr }

        -- Git blame actions
        map("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, vim.tbl_extend(
          "force",
          opts,
          { desc = "Show full git blame" }
        ))

        -- Toggle actions
        map(
          "n",
          "<leader>tb",
          gitsigns.toggle_current_line_blame,
          vim.tbl_extend("force", opts, { desc = "Toggle line blame" })
        )

        map(
          "n",
          "<leader>tB",
          ":G blame<CR>",
          vim.tbl_extend(
            "force",
            opts,
            { desc = "Toggle file blame (fugitive)" }
          )
        )
      end,
    })
  end,
}
