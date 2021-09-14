local fn = vim.fn
local cmd = vim.cmd

local M = {}

function M.bootstrap()
	-- Auto-install packer if not installed
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	end
	cmd('packadd packer.nvim')
	cmd('autocmd BufWritePost plugins.lua PackerCompile')
end

function M.setup(config, plugins)
	M.bootstrap()

	local packer = require('packer')
	packer.init(config)
	return packer.startup({
		function(use)
			plugins(use)
		end
	})
end

return M
