local dap = require('dap')

local function debug_jest(test_name, file_name)
	print('Starting ' .. test_name .. ' in ' .. file_name)
	dap.run({
		type = 'node2',
		request = 'launch',
		cwd = vim.fn.getcwd(),
		runtimeArgs = {
			'--inspect-brk',
			'/usr/local/bin/jest',
			'--no-coverage',
			'-t',
			test_name,
			'--',
			file_name
		},
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = { '<node_internals/**/*.js' },
		console = 'integratedTerminal',
		port = 9229,
	})
end

local M = {}

M.extend_config = function(config)
end

M.attach = function()
	print('Attaching...')
	dap.run({
		type = 'node2',
		request = 'attach',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = { '<node_internals/**/*.js' }
	})
end

return M
