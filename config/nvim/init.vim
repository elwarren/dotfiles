" fresh .nvimrc 

" macbook pro touchbar and ipad both lost ESC key so remap to jj
inoremap jj <Esc>
inoremap kk <Tab>

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" highlight current row
set cursorline
hi CursorLine term=bold

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" spaces not tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

