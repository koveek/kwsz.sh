" set leader key to space
let mapleader = "\<Space>"
nnoremap <Space> <Nop>

" writing into black hole register to 'just' delete instead of cutting
nnoremap d "_d
vnoremap d "_d

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

inoremap <C-n> <Nop>
inoremap <C-p> <Nop>

set clipboard=unnamedplus

" disable vi compatibility
set nocompatible

" tab auto completion menu and ignore file extensions
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

syntax on

" highlight matching elements incrementally during search
set incsearch

" ignore case during search
set ignorecase

" highlight matches during search
set hlsearch

" set tab width to four columns.
set tabstop=4

set scrolloff=10

" enable line numbers
set number

" enable relative numbers in normal mode
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
