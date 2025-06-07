return {
  "williamboman/mason.nvim",
  dependencies = {
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
  },
  config = function()
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
