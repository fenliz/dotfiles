call plug#begin('~/.vim/plugged')

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'gruvbox-community/gruvbox'

call plug#end()

" Set leader key
let mapleader=","

" Copy to system clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y

" Copy whole file to system clipboard
nnoremap <leader>Y gg"+yG

" Paste from system clipboard
nnoremap <leader>p "*p

" Replace-paste keeping the content in the paste-buffer
vnoremap <leader>p "_dP

" Delete (without saving to register)
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Rename current word in file
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Move line up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
