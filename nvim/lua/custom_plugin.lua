local utils = require('utils')

utils.nmap('<leader>PT', ':lua require("custom_plugin").test()<CR>')
utils.nmap('<leader>PR', ':lua require("custom_plugin").reload() <CR>')

local M = {}

M.test = function()
	local ts_utils = require('nvim-treesitter.ts_utils')
	local parsers = require('nvim-treesitter.parsers')
	local locals = require('nvim-treesitter.locals')

	local lang = parsers.get_buf_lang()
	if not parsers.has_parser(lang) then
		return
	end

	-- ((string) @prop (#eq? @prop "\"dependencies\""))
	-- ((string) @prop (#eq? @prop "\"devDependencies\""))
	-- ({
	-- 	(pair
	-- 		key: (string (string_content) @key)
	-- 		value: (object) @value)
	-- 	(#eq? @key "dependencies")
	-- }) @deps
	--
	local bufnr = vim.api.nvim_get_current_buf()
	local node = ts_utils.get_node_at_cursor()

	print(node:type())
end

M.reload = function()
	package.loaded['custom_plugin'] = nil
end

return M.test()



