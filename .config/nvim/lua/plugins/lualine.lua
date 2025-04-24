return {
  "nvim-lualine/lualine.nvim",
  priority = 1001,
  config = function()
    require("lualine").setup({
      options = {
        -- theme = require('material.lualine'),
        theme = "material",
        -- theme = "poimandres",
        -- theme = "catppuccin",
        -- theme = require("extras.gruvbox_lualine").stealth_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          -- Show the relative file path
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {
          -- {
          --     function()
          --         local clients = vim.lsp.get_active_clients()
          --         if next(clients) == nil then
          --             return 'No LSP'
          --         end
          --         local names = {}
          --         for _, client in pairs(clients) do
          --             table.insert(names, client.name)
          --         end
          --         return table.concat(names, ', ')
          --     end,
          --     icon = ' LSP:',
          -- },
          "encoding",
          "fileformat",
          "filetype",
          -- 'encoding', { "fileformat", symbols = { unix = " " } }, 'filetype',
          {
            -- Show current directory (workspace) in lualine_x
            function()
              local cwd = vim.fn.getcwd()
              return vim.fn.fnamemodify(cwd, ":t")
            end,
            icon = " ",
          },
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "location",
        },
      },
    })
  end,
}
