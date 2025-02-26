return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },             -- Required
        { "williamboman/mason.nvim" },           -- Optional
        { "williamboman/mason-lspconfig.nvim" }, -- Optional
    },
    config = function()
        local lsp = require("lsp-zero")
        lsp.preset("recommended")
        lsp.setup()

        local capabilites = require("cmp_nvim_lsp").default_capabilities()

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local bufnr = ev.buf
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
                local function desc(description)
                    return { noremap = true, silent = true, buffer = bufnr, desc = description }
                end

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = bufnr }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gH", vim.lsp.buf.references, opts)
                vim.keymap.set({ "n", "v" }, "<leader>lf", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
                vim.keymap.set({ "n", "v" }, "<C-S-i>", function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
                -- Toggle inlay hints
                vim.keymap.set('n', '<leader>ih', function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end, { desc = '[lsp] toggle inlay hints' })

                -- Toggle Virtual Text
                local show_virtual_text = true

                function ToggleVirtualText()
                    show_virtual_text = not show_virtual_text
                    vim.diagnostic.config({
                        virtual_text = show_virtual_text,
                    })
                    vim.notify("Virtual text " .. (show_virtual_text and "enabled" or "disabled"),
                        vim.log.levels.INFO)
                end

                vim.keymap.set("n", "<leader>tv", ToggleVirtualText,
                    { desc = "Toggle virtual text diagnostics" })
            end,
        })

        require("mason").setup({
            ensure_installed = {
                "shfmt",
                "black",
            },
        })
        require("mason-lspconfig").setup({
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
            handlers = {
                function(server_name)
                    if server_name == "rust_analyzer" or server_name == "hls" then
                        -- Prevent rust-analyzer and hls from being attached directly
                        return
                    end
                    require("lspconfig")[server_name].setup({
                        capabilites = capabilites,
                    })
                end,
            },
        })

        require("lspconfig").lua_ls.setup({
            capabilites = capabilites,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                        },
                    },
                    format = {
                        defaultConfig = {
                            max_line_length = "100", -- Set max width for formatting
                        },
                    },
                },
            },
        })
    end,
}
