-- vim.lsp.enable({
--   "gopls",
--   "lua_ls",
-- })

local map = require("utils.map")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    local bufnr = ev.buf
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings with descriptions
    local opts = { buffer = bufnr }

    -- Navigation
    map("n", "K", function()
      vim.lsp.buf.hover({ border = "single" })
    end, vim.tbl_extend("force", opts, { desc = "Show hover information" }))

    map(
      "n",
      "gH",
      vim.lsp.buf.references,
      vim.tbl_extend("force", opts, { desc = "Show references" })
    )
    map(
      "n",
      "gD",
      vim.lsp.buf.declaration,
      vim.tbl_extend("force", opts, { desc = "Go to declaration" })
    )
    map(
      "n",
      "gd",
      vim.lsp.buf.definition,
      vim.tbl_extend("force", opts, { desc = "Go to definition" })
    )
    map(
      "n",
      "gi",
      vim.lsp.buf.implementation,
      vim.tbl_extend("force", opts, { desc = "Go to implementation" })
    )
    map(
      "n",
      "go",
      vim.lsp.buf.type_definition,
      vim.tbl_extend("force", opts, { desc = "Go to type definition" })
    )
    map(
      "n",
      "<C-k>",
      vim.lsp.buf.signature_help,
      vim.tbl_extend("force", opts, { desc = "Show signature help" })
    )

    -- Workspace
    map(
      "n",
      "<leader>wa",
      vim.lsp.buf.add_workspace_folder,
      vim.tbl_extend("force", opts, { desc = "Add workspace folder" })
    )
    map(
      "n",
      "<leader>wr",
      vim.lsp.buf.remove_workspace_folder,
      vim.tbl_extend("force", opts, { desc = "Remove workspace folder" })
    )
    map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))

    -- Code Actions
    map(
      "n",
      "<leader>rn",
      vim.lsp.buf.rename,
      vim.tbl_extend("force", opts, { desc = "Rename symbol" })
    )
    map(
      { "n", "v" },
      "<leader>ca",
      vim.lsp.buf.code_action,
      vim.tbl_extend("force", opts, { desc = "Code actions" })
    )

    -- Formatting
    map({ "n", "v" }, "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))

    map({ "n", "v" }, "<C-S-i>", function()
      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))

    -- LSP Features Toggles
    map("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))

    -- Virtual Text Toggle
    local show_virtual_text = false
    local function toggle_virtual_text()
      show_virtual_text = not show_virtual_text
      vim.diagnostic.config({
        virtual_text = show_virtual_text,
      })
      vim.notify(
        "Virtual text " .. (show_virtual_text and "enabled" or "disabled"),
        vim.log.levels.INFO
      )
    end

    map(
      "n",
      "<leader>tv",
      toggle_virtual_text,
      vim.tbl_extend("force", opts, { desc = "Toggle virtual text" })
    )
  end,
})

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "single",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
