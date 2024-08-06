return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
        require("neogit").setup()
        vim.keymap.set("n", "<leader>gs", require("neogit").open, { silent = true, noremap = true })
    end,
}
