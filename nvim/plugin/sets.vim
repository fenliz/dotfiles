" Indent 4 spaces as tabs
set tabstop=4 softtabstop=4
set shiftwidth=4

" Smartly indent new line
set smartindent

" Avoid closing buffers 
set hidden

" Hybrid line numbers
set number relativenumber

" Remove highlighting when searching
set nohlsearch

" Start scrolling when cursor is 8 lines from edges
set scrolloff=8

" Don't wrap text
set nowrap

" Don't use swap/backup-files
set noswapfile
set nobackup

" Persist undo's
set undodir=~/.vim/undodir
set undofile

" Don't display modes
set noshowmode

" Add space beside linenumbers for special symbols
set signcolumn=yes

" Improves performance(?)
set updatetime=50

" Code completion
set completeopt=menuone,noinsert,noselect

" Avoid showing extra message when using completion
set shortmess+=c

" Color theme
set termguicolors
colorscheme gruvbox

" Encoding
set encoding=UTF-8
