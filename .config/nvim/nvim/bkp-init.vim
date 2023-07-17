"----------------------------------------------------------------------------------------------------
"Install plugins in folder e.g. .vim/pack/plugins/start/  :: Nerdtree,
"DevIcons, fzf.vim  :: 
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"-----------------------------------------------------------------------------------------------------
"Plugins
call plug#begin()
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'dylanaraps/wal.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
call plug#end()

"Vim
syntax on
colorscheme wal
set nocompatible
set number
set autoindent
set tabstop=4
set shiftwidth=4
set mouse=a
set laststatus=2
set splitbelow 
set splitright
set smarttab
set smartindent
set wildmode=longest,list,full
set pastetoggle=<F2>
set clipboard=unnamed

"cursorline
"set cursorline
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNR cterm=bold ctermfg=15 ctermbg=9



"for transparent background
hi Normal guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

hi User1 ctermfg=5 ctermbg=none
hi User2 ctermfg=9 ctermbg=none
hi User3 ctermfg=8 ctermbg=none
hi User4 ctermfg=1 ctermbg=none
hi User5 ctermfg=6 ctermbg=none
hi User6 ctermfg=0  ctermbg=11

"keybindings

imap <c-b> <Esc>:NERDTreeToggle<CR>
nmap <c-b> :NERDTreeToggle<CR>

nnoremap <silent> <c-Up> :resize -1<CR>
nnoremap <silent> <c-Down> :resize +1<CR>
nnoremap <silent> <c-left> :vertical resize -1<CR>
nnoremap <silent> <c-right> :vertical resize +1<CR>

nmap <silent> <c-t> :History<CR>
tnoremap <Esc> <C-\><C-n>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '  '
