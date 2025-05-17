return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatting for Lua (stylua)
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          filetypes = { "lua" },
        }),

        -- Formatting for C++
        null_ls.builtins.formatting.clang_format.with({
          extra_args = { "--style", "{IndentWidth: 4, ColumnLimit: 80}" },
          filetypes = { "cpp", "c" },
        }),

        -- Web Development (Prettier)
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--print-width", "80" },
          filetypes = {
            "javascript",
            "typescript",
            "css",
            "scss",
            "html",
            "json",
            "jsonc",
            "yaml",
            "rasi",
            "markdown",
          },
        }),

        -- Python Formatting (Black)
        null_ls.builtins.formatting.black.with({
          extra_args = { "--line-length", "80" },
          filetypes = { "python" },
        }),

        -- Shell Formatting
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "4", "-ci", "-bn", "-sr", "-width", "80" },
        }),
      },
    })
  end,
}
