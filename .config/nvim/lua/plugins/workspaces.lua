return {
    "natecraddock/workspaces.nvim",
    config = function()
        local workspaces = require("workspaces")

        workspaces.setup({
            -- hooks = {
            --   open = { "Telescope find_files" }, -- or "NvimTreeOpen" etc.
            -- },
        })

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- Find & switch projects
        map("n", "<leader>fp", ":Telescope workspaces<CR>", opts)

        -- Add current directory as a workspace
        map("n", "<leader>fa", function()
            local path = vim.fn.getcwd()
            local name = vim.fn.fnamemodify(path, ":t")
            workspaces.add(path, name)
            print("Workspace added: " .. name)
        end, opts)

        -- Remove current workspace
        map("n", "<leader>fr", function()
            local path = vim.fn.getcwd()
            workspaces.remove(path)
            print("Workspace removed: " .. path)
        end, opts)
    end,
}
