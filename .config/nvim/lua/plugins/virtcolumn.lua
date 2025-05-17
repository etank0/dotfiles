return {
  "xiyaowong/virtcolumn.nvim",
  config = function()
    -- char to display the line
    -- vim.g.virtcolumn_char = '▕'
    vim.g.virtcolumn_char = "▏"
    vim.opt.colorcolumn = "80"
  end,
}
