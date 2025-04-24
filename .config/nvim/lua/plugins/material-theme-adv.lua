return {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Set material style before applying the colorscheme
    vim.g.material_style = "darker"

    require("material").setup({
      contrast = {
        terminal = false,
        sidebars = false,
        floating_windows = false,
        cursor_line = false,
        lsp_virtual_text = false,
        non_current_windows = false,
        filetypes = {},
      },

      styles = {
        comments = { --[[ italic = true ]]
        },
        strings = { --[[ bold = true ]]
        },
        keywords = { --[[ underline = true ]]
        },
        functions = { --[[ bold = true, undercurl = true ]]
        },
        variables = {},
        operators = {},
        types = {},
      },

      plugins = {
        "gitsigns",
        "indent-blankline",
        "neogit",
        "neo-tree",
        "nvim-cmp",
        "nvim-web-devicons",
        "telescope",
      },

      disable = {
        colored_cursor = false,
        borders = false,
        background = false,
        term_colors = false,
        eob_lines = false,
      },

      high_visibility = {
        lighter = false,
        darker = true,
      },

      lualine_style = "stealth",
      async_loading = true,
      custom_colors = nil,
      custom_highlights = {},
    })

    -- Apply the material colorscheme
    vim.cmd.colorscheme("material")
    vim.api.nvim_set_hl(
      0,
      "BufferLineOffsetSeparator",
      { bg = "#212121", fg = "#343434" }
    )
    vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#212121", fg = "#212121" })
  end,
}
