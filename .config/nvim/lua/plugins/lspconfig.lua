return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gH", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set(
          "n",
          "<leader>wa",
          vim.lsp.buf.add_workspace_folder,
          opts
        )
        vim.keymap.set(
          "n",
          "<leader>wr",
          vim.lsp.buf.remove_workspace_folder,
          opts
        )
        vim.keymap.set("n", "<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set(
          { "n", "v" },
          "<leader>ca",
          vim.lsp.buf.code_action,
          opts
        )
        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set({ "n", "v" }, "<C-S-i>", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        -- Toggle inlay hints
        vim.keymap.set("n", "<leader>ih", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "[lsp] toggle inlay hints" })

        -- Toggle Virtual Text
        local show_virtual_text = true

        function ToggleVirtualText()
          show_virtual_text = not show_virtual_text
          vim.diagnostic.config({
            virtual_text = show_virtual_text,
          })
          vim.notify(
            "Virtual text " .. (show_virtual_text and "enabled" or "disabled"),
            vim.log.levels.INFO
          )
        end

        vim.keymap.set(
          "n",
          "<leader>tv",
          ToggleVirtualText,
          { desc = "Toggle virtual text diagnostics" }
        )
      end,
    })

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      install_root_dir = vim.fn.expand("~/.nvim/mason"),
    })

    -- installing formatters
    local registry = require("mason-registry")

    local ensure_installed = {
      "stylua",
      "shfmt",
      "black",
      "prettier",
      "clang-format",
    }

    for _, pkg in ipairs(ensure_installed) do
      if not registry.is_installed(pkg) then
        registry.get_package(pkg):install()
      end
    end

    require("mason-lspconfig").setup({
      -- installing language servers
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "clangd",
        "rust_analyzer",
        "pyright",
        "bashls",
        -- "hls",
      },
      automatic_enable = {
        exclude = {
          "rust_analyzer",
          "hls",
        },
      },
    })
  end,
}
