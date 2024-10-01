return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- formatting
                -- null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.black,
                -- null_ls.builtins.formatting.prettier,
                -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
                -- Formatting for JavaScript, TypeScript, CSS, etc.
                --
                -- C++ Formatting
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style", "{IndentWidth: 4}" },
                    filetypes = { "cpp", "c" },
                }),

                -- Web Development
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "javascript", "typescript", "css", "scss", "html", "json", "yaml", "markdown" },
                }),

                -- -- JavaScript and TypeScript Linting
                -- null_ls.builtins.diagnostics.eslint.with({
                --     filetypes = { "javascript", "typescript" },
                -- }),
                --
            },
        })
    end,
}
