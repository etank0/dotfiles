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

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

--
-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'tsserver', 'eslint'})

---callback = function(ev)
---lsp.on_attach(function(client, bufnr)
---local opts = {buffer = ev.buf}
---
---  vim.keymap.set("n", "U", vim.lsp.buf.hover, {buffer = 0})
---  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
---    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
---    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
---    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
---  -- more keybindings...
---end)


-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {buffer = 0})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
