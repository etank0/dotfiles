return {
  "natecraddock/workspaces.nvim",
  config = function()
    local workspaces = require("workspaces")
    local map = require("utils.map")

    workspaces.setup({
      hooks = {
        open = {
          function()
            -- Load session when workspace is opened
            vim.cmd("SessionRestore")
          end,
        },
      },
    })

    -- Workspace Operations
    map(
      "n",
      "<leader>fp",
      ":Telescope workspaces<CR>",
      { desc = "Find and switch projects" }
    )

    map("n", "<leader>fa", function()
      local path = vim.fn.getcwd()
      local name = vim.fn.fnamemodify(path, ":t")
      workspaces.add(path, name)
      print("Workspace added: " .. name)
    end, { desc = "Add current directory as workspace" })

    map("n", "<leader>fr", function()
      local path = vim.fn.getcwd()
      workspaces.remove(path)
      print("Workspace removed: " .. path)
    end, { desc = "Remove current workspace" })
  end,
}
