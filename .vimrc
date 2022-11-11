set number
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab

let mapleader = ' '
let maplocalleader = ','

" bootstrap vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'lervag/vimtex'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'svermeulen/vim-subversive'
call plug#end()

syntax enable
filetype plugin indent on

" vimtex
let g:vimtex_view_method = 'zathura'

" vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
