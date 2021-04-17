call plug#begin('~/.vim/plugged')

" Telescope (Fuzzy finder)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Gruvbox (theme)
Plug 'gruvbox-community/gruvbox'

" LSP (Language server)
Plug 'neovim/nvim-lspconfig'

" Code completion
Plug 'nvim-lua/completion-nvim'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Project explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Statusline
Plug 'hoob3rt/lualine.nvim'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Prettier
Plug 'sbdchd/neoformat'

call plug#end()

" Import lua-scripts
lua require('init')

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
