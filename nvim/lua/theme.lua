local g = vim.g
local o = vim.o

-- Colors
o.termguicolors = true

-- Don't show display modes
o.showmode = false

-- Hybrid relative line numbers
o.number = true
o.relativenumber = true

-- Add space between linenumbers for special symbols
o.signcolumn = 'yes'

-- Theme
g.tokyonight_style = 'night'
vim.cmd('colorscheme tokyonight')

-- Avoid italics (problem with rendering end of line characters)
-- g.tokyonight_italic_comments = false
-- g.tokyonight_italic_keywords = false

local M = {}

M.bootstrap = function()
	local lualine = require('lualine')

	lualine.setup({
		options = {
			theme = 'tokyonight'
		}
	})
end

return M
