return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Formatting for C++
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style", "{IndentWidth: 4, ColumnLimit: 100}" },
                    filetypes = { "cpp", "c" },
                }),

                -- Web Development (Prettier)
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--print-width", "100" },
                    filetypes = { "javascript", "typescript", "css", "scss", "html", "json", "yaml", "markdown" },
                }),

                -- Python Formatting (Black)
                null_ls.builtins.formatting.black.with({
                    extra_args = { "--line-length", "100" },
                    filetypes = { "python" },
                }),
            },
        })
    end,
}
