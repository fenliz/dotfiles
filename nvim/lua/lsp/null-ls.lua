local M = {}

M.setup = function(on_attach)
	local null_ls = require('null-ls')
	local lspconfig = require('lspconfig')

	null_ls.config({
		sources = {
			-- Code actions
			null_ls.builtins.code_actions.gitsigns,

			-- Diagnostics
			null_ls.builtins.diagnostics.eslint_d,
			null_ls.builtins.diagnostics.hadolint,

			-- Formatting
			null_ls.builtins.formatting.eslint_d,
			null_ls.builtins.formatting.prettierd,
		}
	});

	lspconfig['null-ls'].setup({ on_attach = on_attach });
end

return M
