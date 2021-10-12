local utils = require('utils')
local o = vim.o

-- Start scrolling x lines from edge
o.scrolloff = 8

-- Avoid closing buffers
o.hidden = true

-- Open vertical splits to the right
o.splitright = true

-- Open horizontal splits below
o.splitbelow = true

-- Go to previous buffer
utils.nmap('<Backspace>', '<C-^>')

-- Window navigation
utils.nmap('<C-k>', ':lua require("navigation").move_to_window("k")<CR>')
utils.nmap('<C-j>', ':lua require("navigation").move_to_window("j")<CR>')
utils.nmap('<C-h>', ':lua require("navigation").move_to_window("h")<CR>')
utils.nmap('<C-l>', ':lua require("navigation").move_to_window("l")<CR>')

-- Buffer navigation
utils.nmap('<Tab>', ':BufferLineCycleNext<CR>')
utils.nmap('<S-Tab>', ':BufferLineCyclePrev<CR>')

local M = {}

M.move_to_window = function(key)
    local curr_win = vim.api.nvim_get_current_win()
    vim.api.nvim_command('wincmd ' .. key)

    -- If there was no window to move to, create a new window in the direction
    if (curr_win == vim.api.nvim_get_current_win()) then
        if (key == 'j' or key == 'k') then
            vim.api.nvim_command('wincmd s')
        else
            vim.api.nvim_command('wincmd v')
        end
        vim.api.nvim_command('wincmd ' .. key)
    end

end

return M
