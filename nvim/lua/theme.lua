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

local M = {}

M.bootstrap = function()
	local lualine = require('lualine')
	local bufferline = require('bufferline')

	lualine.setup({
		options = {
			theme = 'tokyonight'
		}
	})

	bufferline.setup({
		options = {
			show_close_icon = false,
			show_buffer_close_icons = false,
			enforce_regular_tabs = true,
			diagnostics = 'nvim_lsp',
			offsets = {{ filetype = "NvimTree", text = "", text_align = "left" }},
		}
	})
end

return M
