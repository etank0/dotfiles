return {
  "kosayoda/nvim-lightbulb",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("nvim-lightbulb").setup({
      sign = {
        enabled = true,
        text = " ",
        hl = "LightBulbSign",
      },
      autocmd = { enabled = true },
    })
  end,
}
