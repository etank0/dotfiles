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

    -- Show neogit
    vim.keymap.set(
      "n",
      "<leader>gs",
      require("neogit").open,
      { silent = true, noremap = true }
    )

    -- Function to find if DiffView is Open
    function IsDiffviewOpen()
      local lib = require("diffview.lib")
      local view = lib.get_current_view()
      return view ~= nil
    end

    -- Function to stop LSP clients attached to the diffview buffer
    local function close_diffview()
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local buf_name = vim.api.nvim_buf_get_name(bufnr)
        if buf_name:match("^diffview://") then
          -- Detach and Close LSP clients from this buffer
          for _, client in pairs(vim.lsp.get_active_clients()) do
            if vim.lsp.buf_is_attached(bufnr, client.id) then
              vim.lsp.buf_detach_client(bufnr, client.id)
              client.stop()
            end
          end
        end
      end
      vim.cmd.DiffviewClose()
    end

    -- Toggle function for Diffview with LSP management
    vim.keymap.set("n", "<leader>dv", function()
      if IsDiffviewOpen() then
        close_diffview()
      else
        vim.cmd.DiffviewOpen()
      end
    end, { silent = true, noremap = true })

    -- vim.keymap.set("n", "<leader>dc", function() vim.cmd.DiffviewClose() end, { silent = true, noremap = true })
  end,
}
