set number
set relativenumber

set termguicolors

set tabstop=4
set expandtab
set shiftwidth=4

set autoindent
set smartindent
set breakindent

set undofile

set mouse=a
set scrolloff=10

set showcmd
set showmatch
set hlsearch

set ignorecase
set smartcase
set autowrite

set belloff=all
set hidden
set laststatus=2
syntax on

set splitbelow
set splitright

set updatetime=250
set timeoutlen=300

inoremap jk <Esc>
xnoremap jk <Esc> 
nnoremap <Esc> :set nohlsearch<CR>
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
xnoremap <A-Up> <Esc>:m-2<CR>
xnoremap <A-Down> <Esc>:m+<CR>
