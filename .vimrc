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

set hidden         " Hide buffers instead of unloading them, disables the 'No write since last change' prompt
set confirm        " Prompt to save modified buffers on save

set splitright     " Always put new window to the right of current one
set splitbelow     " Always put new window below current one

set cursorline     " Highlight entire current line

set wildmenu " Show completions options inside command mode  
set completeopt=menuone,noinsert,noselect

let mapleader = ' '
let maplocalleader = ','

" Make Y consistent with C and D
nmap Y y$ 

" Stay in visual mode when shifting
vnoremap < <gv
vnoremap > >gv

nmap <leader>t :vert term<cr>

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
Plug 'tpope/vim-surround'                  " you surround inner word
Plug 'tpope/vim-commentary'                " go comment 4j
Plug 'svermeulen/vim-subversive'           " substitute a paragraph
Plug 'junegunn/vim-easy-align'             " go align innner paragraph
Plug 'wellle/targets.vim'                  " change inner argument
Plug 'jiangmiao/auto-pairs'

Plug 'kana/vim-textobj-user'               " Easily create new text objects
Plug 'glts/vim-textobj-comment'            " change inner comment

Plug 'junegunn/fzf'                        " Fuzzy finder
Plug 'junegunn/fzf.vim'                    " Some vim commands for fzf
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'

Plug 'prabirshrestha/vim-lsp'              " Enable language server protocol integration
Plug 'prabirshrestha/asyncomplete.vim'     " Auto completion
Plug 'prabirshrestha/asyncomplete-lsp.vim' " Auto completion integration with lsp
Plug 'prabirshrestha/async.vim'            " Dependency of the above
call plug#end()

syntax enable
filetype plugin indent on

" vim-subversive
nmap s  <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S  <plug>(SubversiveSubstituteToEndOfLine)

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
let $FZF_DEFAULT_COMMAND="find . -type f -not -path '*/\.git/*'" " Make fzf blazingly fast

" asyncomplete
imap     <C-space> <plug>(asyncomplete_force_refresh)
inoremap <expr>    <tab>   pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr>    <S-tab> pumvisible() ? "\<C-p>" : "\<S-tab>"
inoremap <expr>    <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr>    <C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr>    <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" inoremap <expr>    <tab>   pumvisible() ? asyncomplete#close_popup(): "\<tab>"

let g:asyncomplete_auto_completeopt=0 " Disallow asyncomplete from overwriting completeopt

" vim-lsp
if executable('clangd')
  augroup lsp_clangd
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd']},
          \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
          \ })
  augroup end
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

