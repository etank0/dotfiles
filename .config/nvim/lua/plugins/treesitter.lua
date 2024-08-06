return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            return
        end

        configs.setup({
            ensure_installed = {
                "lua",
                "luadoc",
                "bash",
                "c",
                "cpp",
                "javascript",
                "json",
                "python",
                "typescript",
                "tsx",
                "css",
                "rust",
                "java",
                "yaml",
                "markdown",
                "markdown_inline",
                "vim",
                "vimdoc",
                "php",
                "phpdoc",
            },           -- one of "all" or a list of languages
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "css" }, -- list of language that will be disabled
            },
            autopairs = {
                enable = true,
            },
            indent = { enable = true, disable = { "python", "css" } },
        })
    end,
}
