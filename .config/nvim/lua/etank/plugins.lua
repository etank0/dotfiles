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
  use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }
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
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
end)
