local wk = require('which-key')

wk.register({
	x = {
		name = 'Problems',
		x = { ':TroubleToggle<CR>', 'All' },
		w = { ':TroubleToggle lsp_workspace_diagnostics<CR>', 'Workspace' },
		d = { ':TroubleToggle lsp_document_diagnostics<CR>', 'Document' },
		q = { ':TroubleToggle quickfix<CR>', 'Quickfix' },
		l = { ':TroubleToggle loclist<CR>', 'Loclist' },
	}
}, { prefix = '<leader>' })

local M = {}

M.bootstrap = function()
	local trouble = require('trouble')
	trouble.setup()
end

return M
