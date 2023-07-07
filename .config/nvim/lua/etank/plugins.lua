-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  ---------------------
        -- Package Manager --
        ---------------------
  use 'wbthomason/packer.nvim'

  --------------------
  --Plugins--
  -------------------
  use 'chrisbra/Colorizer'
  use 'junegunn/fzf.vim'

--  use 'neoclide/coc.nvim'

--indentation
--  use "lukas-reineke/indent-blankline.nvim"

--pywal
--  use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
--  use({
--   "atalazer/wally.nvim",
--   run = "./setup.sh",
--   setup = function()
--            vim.g.wally_transparent = true
--   end,
--   config = [[require("wally").colorscheme()]]
--    })
  --Catppuccin theme
  use { "catppuccin/nvim", as = "catppuccin" }
  --lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
--  use 'vim-airline/vim-airline'
  use 'akinsho/bufferline.nvim'
  use 'ryanoasis/vim-devicons'
  use 'dylanaraps/wal.vim'
  use 'preservim/nerdtree'
  use "akinsho/toggleterm.nvim"
  
  -- for lsp
  --use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}

-- Treesitter
  use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
  }

end)
