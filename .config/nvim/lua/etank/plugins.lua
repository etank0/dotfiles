-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    -------------------------------------------------------------
    -- Package Manager --
    -------------------------------------------------------------
    use 'wbthomason/packer.nvim'

    -------------------------------------------------------------
    -- Tmux Navigator --
    -------------------------------------------------------------
    ---
    use 'christoomey/vim-tmux-navigator'
    -------------------------------------------------------------
    -- Plugins --
    -------------------------------------------------------------
    use 'junegunn/fzf.vim'

    -------------------------------------------------------------
    -- Theming --
    -------------------------------------------------------------
    --pywal
    -- use 'dylanaraps/wal.vim'
    use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }

    --Catppuccin theme
    -- use { "catppuccin/nvim", as = "catppuccin" }

    -- Rosepine theme
    -- use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- Material theme
    use({ 'kaicataldo/material.vim', as = 'material' })

    -- Nord theme
    -- use({ 'shaunsingh/nord.nvim' })

    -------------------------------------------------------------
    -- Editor Utils --
    -------------------------------------------------------------
    -- Colorizer
    use {
        "norcalli/nvim-colorizer.lua"
    }

    -- Colored Separators
    use {
        "nvim-zh/colorful-winsep.nvim",
        config = function()
            require('colorful-winsep').setup()
        end
    }

    -- commenting
    use "numToStr/Comment.nvim"
    --indentation
    use "lukas-reineke/indent-blankline.nvim"

    --lualine
    use {
        'nvim-lualine/lualine.nvim',
    }

    -- nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
    }

    use { 'nvim-tree/nvim-web-devicons' }

    --  use 'vim-airline/vim-airline'
    use 'akinsho/bufferline.nvim'
    use "akinsho/toggleterm.nvim"

    -- for lsp
    --use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }


    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        -- or                            , tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
end)
