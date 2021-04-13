" Go to project file (Ctrl + P)
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

" Fuzzy search in project (<leader> + p + s)
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Search for > ")})<CR>
