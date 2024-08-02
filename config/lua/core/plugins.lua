-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -------------------------------------------------------------
    -- Tmux Navigator --
    -------------------------------------------------------------
    ---
    "christoomey/vim-tmux-navigator",
    -------------------------------------------------------------
    -- Plugins --
    -------------------------------------------------------------
    "junegunn/fzf.vim",

    -------------------------------------------------------------
    -- Theming --
    -------------------------------------------------------------
    -- Pywal
    -- 'dylanaraps/wal.vim'
    -- { 'AlphaTechnolog/pywal.nvim', name = 'pywal' },

    -- Catppuccin theme
    -- { "catppuccin/nvim", name = "catppuccin" },

    -- Rosepine theme
    -- { 'rose-pine/neovim', name = 'rose-pine' },

    -- Material theme
    { 'kaicataldo/material.vim',    name = 'material' },

    -- Nord theme
    -- { 'shaunsingh/nord.nvim' },

    -------------------------------------------------------------
    -- Editor Utils --
    -------------------------------------------------------------
    -- Colorizer
    {
        "norcalli/nvim-colorizer.lua"
    },

    -- Colored Separators
    {
        "nvim-zh/colorful-winsep.nvim",
        config = function()
            require('colorful-winsep').setup()
        end
    },

    -- commenting
    "numToStr/Comment.nvim",
    --indentation
    "lukas-reineke/indent-blankline.nvim",

    --lualine
    {
        'nvim-lualine/lualine.nvim',
    },

    -- nvim-tree
    {
        'nvim-tree/nvim-tree.lua',
    },

    { 'nvim-tree/nvim-web-devicons' },

    --  use 'vim-airline/vim-airline'
    "akinsho/bufferline.nvim",
    "akinsho/toggleterm.nvim",

    -- for lsp
    --use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
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
    },


    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
})
