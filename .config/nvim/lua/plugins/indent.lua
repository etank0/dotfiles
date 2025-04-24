return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.opt.list = true
    require("ibl").setup({
      -- Change this to your preferred character
      indent = { char = "▏" },
    })
  end,
}
