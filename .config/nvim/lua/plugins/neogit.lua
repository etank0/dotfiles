return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = function()
    local map = require("utils.map")
    local neogit = require("neogit")

    -- Setup Neogit
    neogit.setup()

    -- Show neogit
    map("n", "<leader>gs", neogit.open, { desc = "Open Neogit" })

    -- DiffView Utilities
    local function is_diffview_open()
      local lib = require("diffview.lib")
      return lib.get_current_view() ~= nil
    end

    local function close_diffview()
      -- Detach and close LSP clients from diffview buffers
      for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local buf_name = vim.api.nvim_buf_get_name(bufnr)
        if buf_name:match("^diffview://") then
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

    -- DiffView Toggle
    map("n", "<leader>dv", function()
      if is_diffview_open() then
        close_diffview()
      else
        vim.cmd.DiffviewOpen()
      end
    end, { desc = "Toggle Diffview" })

    -- Uncomment if you need a direct close mapping
    -- map("n", "<leader>dc", vim.cmd.DiffviewClose, { desc = "Close Diffview" })
  end,
}
