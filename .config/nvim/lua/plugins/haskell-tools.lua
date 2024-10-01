return {
    'mrcjkb/haskell-tools.nvim',
    version = '^4',
    lazy = false, -- Load the plugin immediately
    config = function()
        vim.g.haskell_tools = {
            hls = {
                on_attach = function(client, bufnr, ht)
                    local opts = { noremap = true, silent = true, buffer = bufnr }

                    -- Set keybindings for Haskell Language Server
                    vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, opts)
                    vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)
                    vim.keymap.set('n', '<leader>ea', ht.lsp.buf_eval_all, opts)
                    vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
                    vim.keymap.set('n', '<leader>rt', ht.repl.reload, opts)
                    vim.keymap.set('n', '<leader>rf', function()
                        ht.repl.toggle(vim.api.nvim_buf_get_name(0))
                    end, opts)
                    vim.keymap.set('n', '<leader>rq', ht.repl.quit, opts)
                end,
            },
        }
    end,
}
