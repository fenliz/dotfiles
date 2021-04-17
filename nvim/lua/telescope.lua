local M = {}

-- Function for triggering search within dotfiles
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Dotfiles >",
        cwd = "$HOME/development/dotfiles",
    })
end

return M
