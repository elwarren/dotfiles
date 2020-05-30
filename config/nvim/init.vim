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

" added for vimwiki
set nocompatible
filetype plugin on
syntax on

" https://github.com/junegunn/vim-plug
call plug#begin( stdpath('data') . '/plugged' )
Plug 'vimwiki/vimwiki'
Plug 'pbrisbin/vim-mkdir'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
call plug#end()

" https://github.com/vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" if we disable vimwiki can still map ww to open ~/Documents/vimwiki/index.md
" nnoremap <Leader>ww :e ~/Documents/vimwiki/index.md<cr>


" https://github.com/vim-airline/vim-airline-themes
" https://github.com/vim-airline/vim-airline
let g:airline_powerline_fonts = 1

let g:neomake_python_enabled_makers = ['pylint']

" disable folding everywhere, can't read my mardown files with it enabled
autocmd BufWritePost,BufEnter * set nofoldenable foldmethod=manual foldlevelstart=99

