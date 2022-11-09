set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab

let mapleader = ' '
let maplocalleader = ','

syntax enable

call plug#begin()
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

filetype plugin indent on

" vimtex
let g:vimtex_view_method = 'zathura'
