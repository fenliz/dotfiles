local utils = require('utils')
local wk = require('which-key')

-- Find project file
utils.nmap('<C-p>', ':lua require("telescope.builtin").git_files()<CR>')

wk.register({
	f = {
		name = 'Find',
		s = { ':lua require("telescope.builtin").grep_string{ search = vim.fn.input("🔍 ") }<CR>', 'Text' },
		w = { ':lua require("telescope.builtin").grep_string{ search = vim.fn.expand("<cword>") }<CR>', 'Current word' },
		f = { ':lua require("telescope.builtin").find_files()<CR>', 'Current directory' },
		r = { ':lua require("telescope.builtin").oldfiles()<CR>', 'Recent files' },
		d = { ':lua require("finder").search_dotfiles()<CR>', 'Dotfiles' },
	},
	["'"] = { ':lua require("telescope.builtin").marks()<CR>', 'Marks' },
	[";"] = { ':lua require("telescope.builtin").buffers()<CR>', 'Buffers' },
}, { prefix = '<leader>' })

local M = {}

-- Trigger search in dotfiles
M.search_dotfiles = function()
	local builtin = require('telescope.builtin')
	local env = vim.env

	builtin.find_files({
		prompt_title = "< Dotfiles >",
		cwd = env.DOTFILES,
		hidden = true
	})
end

M.bootstrap = function()
	local actions = require('telescope.actions')
	local telescope = require('telescope')

	telescope.setup({
		defaults = {
			prompt_prefix = '🔍 ',
			selection_caret = ' ',
			entry_prefix = ' ',

			layout_strategy = 'bottom_pane',
			layout_config = {
				height = 35,
			},

			mappings = {
				i = { ['<ESC>'] = actions.close },
				n = { ['<ESC>'] = actions.close }
			},
		}
	})
end

return M
