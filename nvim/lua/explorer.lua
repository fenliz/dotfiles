local tree_cb = require('nvim-tree.config').nvim_tree_callback
local wk = require('which-key')
local g = vim.g

-- Set width
g.nvim_tree_width = 30

-- Show indent markers
g.nvim_tree_indent_markers = 1

-- Open file explorer in new tab if it was already open
g.nvim_tree_tab_open = 1

-- Follow location of open file in file explorer
g.nvim_tree_follow = 1

-- Open on startup
g.nvim_tree_auto_open = 1

-- Ignore git-ignored files
g.nvim_tree_gitignore = 1

-- Set root node (workspace) name
g.nvim_tree_root_folder_modifier = ':t'

-- Show error/warnings in files
g.nvim_tree_lsp_diagnostics = 1

-- Files to highlight
g.nvim_tree_special_files = {}

-- Don't choose what window to open in (if multiple is opened)
g.nvim_tree_disable_window_picker = 1

g.nvim_tree_bindings = {
	{ key = 't', cb = tree_cb('tabnew') },
	{ key = 'l', cb = tree_cb('edit') },
	{ key = 'h', cb = tree_cb('parent_node') },
};

g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

wk.register({
	e = {
		name = 'Explorer',
		e = { ':NvimTreeFocus<CR>', 'Open' },
		c = { ':NvimTreeClose<CR>', 'Close' },
	}
}, { prefix = '<leader>' })
