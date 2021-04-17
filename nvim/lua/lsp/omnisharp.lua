local pid = vim.fn.getpid()
local omnisharp_bin = "/home/charlie/vendor/omnisharp-roslyn/run"

require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
	on_attach = require'completion'.on_attach,
}
