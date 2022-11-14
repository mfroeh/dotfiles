set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

set incsearch

set noesckeys " Disable delay when using O

set termguicolors

set undodir=~/.vim/undo-dir
set undofile

set bg=dark

nmap Y y$

let mapleader = ' '
let maplocalleader = ','

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" bootstrap vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'svermeulen/vim-subversive'
Plug 'jiangmiao/auto-pairs'

Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
call plug#end()

syntax enable
filetype plugin indent on

" vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" gruvbox
colorscheme gruvbox

" vimtex
let g:vimtex_view_method = 'zathura'

" auto-pairs
let g:AutoPairsFlyMode = 1
