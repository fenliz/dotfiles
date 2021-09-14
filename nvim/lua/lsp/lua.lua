local M = {}

M.extend_config = function(config)
	local expand = vim.fn.expand
	local split = vim.split

	config.settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = split(package.path, ';'),
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = {
					[expand('$VIMRUNTIME/lua')] = true,
					[expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				},
			},
		}
	}
end

return M
