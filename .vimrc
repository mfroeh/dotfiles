set number         " Show numbers on the left
set relativenumber " Make all numbers relative to the current line

set tabstop=2      " Show tabs as 4 spaces
set softtabstop=2  " Delete spaces in quantities
set shiftwidth=2   " Number of spaces to use when using >> or auto indenting
set expandtab      " Insert spaces when using tabs or indenting
set autoindent     " Copies the indent from the current line when starting a new line
set smartindent    " Smarter autoindent

set incsearch      " Highlight matches whilst searching
set ignorecase     " Ignore case of letters when searching
set smartcase      " Ignore ignorecase if pattern contains uppercase characters

set termguicolors  " Use 24-bit colors

set timeoutlen=600 " Wait this many ms for mappings to complete
set ttimeoutlen=0
set noesckeys      " Disable delay when using O

set cursorline     " Highlight entire current line

nmap Y y$ " Make Y consistent with C and D

let mapleader = ' '
let maplocalleader = ','

" Set and boostrap persitent undo
if has('persistent_undo')
    set undofile " Undo persistent over sessions
    set undodir=~/.vim/undo-dir
    silent call system('mkdir -p ' . &undodir)
endif

" bootstrap vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-surround'        " you surround inner word
Plug 'tpope/vim-commentary'      " go comment 4j
Plug 'svermeulen/vim-subversive' " substitute a paragraph
Plug 'junegunn/vim-easy-align'   " go align innner paragraph
Plug 'wellle/targets.vim'        " change inner argument
Plug 'jiangmiao/auto-pairs'

Plug 'junegunn/fzf'              " Fuzzy finder
Plug 'junegunn/fzf.vim'          " Some vim commands for fzf
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
call plug#end()

syntax enable
filetype plugin indent on

" vim-subversive
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)

" vim-easy-align
nmap ga <plug>(EasyAlign)
xmap ga <plug>(EasyAlign)

" gruvbox
colorscheme gruvbox
set bg=dark

" vimtex
let g:vimtex_view_method = 'zathura'

" fzf
nmap <C-p> :Files<cr>
