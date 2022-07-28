syntax on

set nocompatible
set number
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
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
hi CursorLineNR cterm=bold ctermfg=9 ctermbg=8




let &t_ut=''
"for filetree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4 
let g:netrw_altv = 1
let g:netrw_winsize = 15
"augroup ProjectDrawer
 " autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

"g varible for status line
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}



set statusline=
set statusline+=%#NonText#
set statusline+=%6*\ %{toupper(g:currentmode[mode()])}
set statusline+=\ %*
set statusline+=%2*\ %l
set statusline+=%3*\ ::
set statusline+=\ %L
set statusline+=\ [%c]
set statusline+=%=
set statusline+=%4*\ ‹‹
set statusline+=\ %f
set statusline+=\ ››
set statusline+=\ %*
set statusline+=%5*\ %y
set statusline+=\ %r
set statusline+=\ %*
set statusline+=%3*\%{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %*
set statusline+=%1*\ ‹‹
set statusline+=\ %{strftime('%R',getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

"vim colors
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
hi Normal guibg=NONE ctermbg=NONE

hi User1 ctermfg=5 ctermbg=none
hi User2 ctermfg=9 ctermbg=none
hi User3 ctermfg=8 ctermbg=none
hi User4 ctermfg=1 ctermbg=none
hi User5 ctermfg=6 ctermbg=none
hi User6 ctermfg=0  ctermbg=11

"keybindings

imap <c-b> <Esc>:NERDTreeToggle<CR>
nmap <c-b> :NERDTreeToggle<CR>
