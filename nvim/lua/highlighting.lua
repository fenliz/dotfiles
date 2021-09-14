
local M = {}

M.bootstrap = function()
	local treesitter = require('nvim-treesitter.configs')
	treesitter.setup({
		ensure_installed = 'all',
		highlight = { enable = true },
		autotag = { enable = true },
		rainbow = { enable = true },
		context_commentstring = { enable = true },

		textsubjects = {
			enable = true,
			keymaps = {
				['.'] = 'textsubjects-smart',
				[';'] = 'textsubjects-container-outer'
			}
		},

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
				}
			}
		}
	})
end

return M
