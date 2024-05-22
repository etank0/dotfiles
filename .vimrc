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
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
"Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ryanoasis/vim-devicons'
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

imap <c-b> <Esc>:NERDTreeToggle<CR>
nmap <c-b> :NERDTreeToggle<CR>

nnoremap <silent> <c-Up> :resize -1<CR>
nnoremap <silent> <c-Down> :resize +1<CR>
nnoremap <silent> <c-left> :vertical resize -1<CR>
nnoremap <silent> <c-right> :vertical resize +1<CR>

nmap <silent> <c-`> :terminal<CR>
nmap <silent> <c-h> :History<CR>


"built in files

"let &t_ut=''
"for filetree
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4 
"let g:netrw_altv = 1
"let g:netrw_winsize = 15
"augroup ProjectDrawer
" " autocmd!
"  "autocmd VimEnter * :Vexplore
"augroup END

"----------------CUSTOM STATUS LINE-----------------
"g varible for status line
"let g:currentmode={
"    \ 'n'  : 'Normal',
"    \ 'no' : 'Normal·Operator Pending',
"    \ 'v'  : 'Visual',
"    \ 'V'  : 'V·Line',
"    \ '^V' : 'V·Block',
"    \ 's'  : 'Select',
"    \ 'S'  : 'S·Line',
"    \ '^S' : 'S·Block',
"    \ 'i'  : 'Insert',
"    \ 'R'  : 'Replace',
"    \ 'Rv' : 'V·Replace',
"    \ 'c'  : 'Command',
"    \ 'cv' : 'Vim Ex',
"    \ 'ce' : 'Ex',
"    \ 'r'  : 'Prompt',
"    \ 'rm' : 'More',
"    \ 'r?' : 'Confirm',
"    \ '!'  : 'Shell',
"    \ 't'  : 'Terminal'
"    \}
"
"
"
"set statusline=
"set statusline+=%#NonText#
"set statusline+=%6*\ %{toupper(g:currentmode[mode()])}
"set statusline+=\ %*
"set statusline+=%2*\ %l
"set statusline+=%3*\ ::
"set statusline+=\ %L
"set statusline+=\ [%c]
"set statusline+=%=
"set statusline+=%4*\ ‹‹
"set statusline+=\ %f
"set statusline+=\ ››
"set statusline+=\ %*
"set statusline+=%5*\ %y
"set statusline+=\ %r
"set statusline+=\ %*
"set statusline+=%3*\%{&fileencoding?&fileencoding:&encoding}
"set statusline+=\ %*
"set statusline+=%1*\ ‹‹
"set statusline+=\ %{strftime('%R',getftime(expand('%')))}
"set statusline+=\ ::
"set statusline+=\ %n
"set statusline+=\ ››\ %*
"
"
"hi User1 ctermfg=5 ctermbg=none
"hi User2 ctermfg=9 ctermbg=none
"hi User3 ctermfg=8 ctermbg=none
"hi User4 ctermfg=1 ctermbg=none
"hi User5 ctermfg=6 ctermbg=none
"hi User6 ctermfg=0  ctermbg=11 cterm=bold

"-------------------------------------------------------------------------------
"lightline
let g:lightline={ 
			\'colorscheme': 'material_vim',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified',] ]
			\ },
			"\ 'component': {
			"\   'helloworld': 'no nvim today?'
	 		"\ },
			\ }
