set number " Show numbers on the left
set relativenumber " Make all numbers relative to the current line

set tabstop=4 " Show tabs as 4 spaces
set shiftwidth=4 " Number of spaces to use when using >> or auto indenting
set expandtab " Insert spaces when using tabs or indenting
set smartindent " Smart autoindenting when starting a new line

set incsearch " Highlight matches whilst searching
set ignorecase " Ignore case of letters when searching
set smartcase " Ignore ignorecase if pattern contains uppercase characters

set noesckeys " Disable delay when using O

set termguicolors " Use 24-bit colors

set undofile " Undo persistent over sessions
set undodir=~/.vim/undo-dir

nmap Y y$ " Make Y consistent with C and D

let mapleader = ' '
let maplocalleader = ','

" bootstrap vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-surround' " you surround inner word
Plug 'tpope/vim-commentary' " go comment 4j
Plug 'svermeulen/vim-subversive' " substitute a paragraph
Plug 'jiangmiao/auto-pairs' " (Let me out of the parentheses) thanks!

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
set bg=dark

" vimtex
let g:vimtex_view_method = 'zathura'

" auto-pairs
let g:AutoPairsFlyMode = 1
