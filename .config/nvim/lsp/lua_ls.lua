return {
  cmd = {
    "lua-language-server",
  },
  filetypes = {
    "lua",
  },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "styula.toml",
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
        },
      },
      format = {
        enable = false,
      },
    },
  },

  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
