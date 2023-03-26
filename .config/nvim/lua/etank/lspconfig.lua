--Install pyright by npm install -g pyright
--require'lspconfig'.pyright.setup{
--	on_attach = function()
--		vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
--		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
--	end,
--}

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = {omit = {'K'}},
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'tsserver', 'eslint'})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set("n", "U", vim.lsp.buf.hover, {buffer = 0})
  -- more keybindings...
end)

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
