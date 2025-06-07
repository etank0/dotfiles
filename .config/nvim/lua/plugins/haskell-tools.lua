return {
  "mrcjkb/haskell-tools.nvim",
  version = "^4",
  lazy = false, -- Load the plugin immediately
  config = function()
    local map = require("utils.map")
    local ht = require("haskell-tools")

    vim.g.haskell_tools = {
      hls = {
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr }

          -- Code Lens & Documentation
          map(
            "n",
            "<leader>cl",
            vim.lsp.codelens.run,
            vim.tbl_extend("force", opts, { desc = "Hasekell: Run code lens" })
          )
          map(
            "n",
            "<leader>hs",
            ht.hoogle.hoogle_signature,
            vim.tbl_extend(
              "force",
              opts,
              { desc = "Haskell: Hoogle signature" }
            )
          )

          -- Evaluation
          map(
            "n",
            "<leader>ea",
            ht.lsp.buf_eval_all,
            vim.tbl_extend("force", opts, { desc = "Haskell: Evaluate all" })
          )

          -- REPL Management
          map(
            "n",
            "<leader>rr",
            ht.repl.toggle,
            vim.tbl_extend("force", opts, { desc = "Haskell: Toggle REPL" })
          )
          map(
            "n",
            "<leader>rt",
            ht.repl.reload,
            vim.tbl_extend("force", opts, { desc = "Haskell: Reload REPL" })
          )
          map(
            "n",
            "<leader>rf",
            function()
              ht.repl.toggle(vim.api.nvim_buf_get_name(0))
            end,
            vim.tbl_extend(
              "force",
              opts,
              { desc = "Haskell: Toggle file in REPL" }
            )
          )
          map(
            "n",
            "<leader>rq",
            ht.repl.quit,
            vim.tbl_extend("force", opts, { desc = "Haskell: Quit REPL" })
          )
        end,

        settings = {
          haskell = {
            formatting = {
              indentSize = 2,
              maxLineLength = 80,
            },
          },
        },
      },
    }
  end,
}
