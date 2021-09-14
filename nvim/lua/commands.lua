local M = {}

M.bootstrap = function()
	local which_key = require('which-key')

	which_key.setup({})
end

return M
