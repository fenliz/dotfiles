local wk = require('which-key')

wk.register({
	g = {
		name = 'Git',
		g = { ':Neogit<CR>', 'Browser' },
		G = { ':lua require("telescope.builtin").git_status()<CR>', 'Status' },
		b = { ':lua require("telescope.builtin").git_branches()<CR>', 'Branches' },
		c = { ':lua require("telescope.builtin").git_commits()<CR>', 'Commits' },
		f = { ':lua require("telescope.builtin").git_bcommits()<CR>', 'File history' },
		s = { ':lua require("telescope.builtin").git_stash()<CR>', 'Stashes' },
	},
}, { prefix = '<leader>' })

local M = {}

M.bootstrap = function()
	local neogit = require('neogit')
	local diffview = require('diffview')
	local gitsigns = require('gitsigns')
	local cb = require('diffview.config').diffview_callback

	neogit.setup({
		integrations = { diffview = true }
	})

	diffview.setup({
		diff_binaries = false,
		file_panel = {
			width = 35,
		},
		key_bindings = {
			disable_defaults = true,

			view = {
				['<tab>']		= cb('select_next_entry'),
				['<s-tab>']		= cb('select_prev_entry'),
				['<leader>e']	= cb('focus_files'),
				['<leader>b']	= cb('toggle_files'),
			},
			file_panel = {
				['j']			= cb('next_entry'),
				['k']			= cb('prev_entry'),
				['<cr>']		= cb('select_entry'),
				['l']			= cb('select_entry'),
				['-']			= cb('toggle_stage_entry'),
				['S']			= cb('stage_all'),
				['U']			= cb('unstage_all'),
				['X']			= cb('restore_entry'),
				['R']           = cb('refresh_files'),
				['<tab>']       = cb('select_next_entry'),
				['<s-tab>']     = cb('select_prev_entry'),
				['<leader>e']   = cb('focus_files'),
				['<leader>b']	= cb('toggle_files'),
			}
		}
	})

	gitsigns.setup()
end

return M
