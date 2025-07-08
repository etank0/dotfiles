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
Plug 'junegunn/fzf.vim'
" Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"Plug 'catppuccin/vim', { 'as': 'catppuccin' }
"Plug 'dylanaraps/wal.vim'
call plug#end()

"Vim
syntax on
let g:material_theme_style = 'darker'
colorscheme material
set nocompatible
set numberwidth=5
set fileencoding=utf
set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set mouse=a
set laststatus=2
set splitbelow 
set splitright
set termwinsize=10x90
set smarttab
set smartindent
set wildmode=longest,list,full
set ttymouse=sgr
set pastetoggle=<F2>
set clipboard=unnamed
set fillchars=eob:\ 

if (has('termguicolors'))
  set termguicolors
endif

"cursorline
"set cursorline
"highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
"highlight CursorLineNR cterm=bold ctermfg=15 ctermbg=NONE

"for transparent background
"hi Normal guibg=NONE ctermbg=NONE
"hi EndOfBuffer guibg=NONE ctermbg=NONE

"keybindings

" imap <c-e> <Esc>:NERDTreeToggle<CR>
" nmap <c-e> :NERDTreeToggle<CR>

nnoremap <silent> <c-Up> :resize -1<CR>
nnoremap <silent> <c-Down> :resize +1<CR>
nnoremap <silent> <c-left> :vertical resize -1<CR>
nnoremap <silent> <c-right> :vertical resize +1<CR>

nmap <silent> <c-`> :terminal<CR>
nmap <silent> <c-s-j> :terminal<CR>
nmap <silent> <c-\> :History<CR>

"-------------------------------------------------------------------------------
"lightline
let g:lightline={ 
			\'colorscheme': 'material_vim',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified',] ]
			\ },
			\ 'component_function': {
			\   'filetype': 'MyFiletype',
			\   'fileformat': 'MyFileformat',
			\ }
			\ }

function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol() . ' ' . &fileformat) : ''
endfunction
