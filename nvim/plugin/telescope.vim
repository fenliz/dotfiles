" Go to project file (Ctrl + P)
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

" Fuzzy search in project (<leader> + p + s)
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Search for > ")})<CR>

" Fuzzy search in project files (<leader> + p + f)
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>

" Fuzzy search for selected word in project (<leader> + p + w)
nnoremap <leader>pw :lua require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })<CR>

" Fuzzy search dotfiles (<leader> + v + r + c)
nnoremap <leader>vrc :lua require('telescope').search_dotfiles()<CR>
