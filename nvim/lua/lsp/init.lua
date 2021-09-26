local utils = require('utils')

-- Trigger code actions
utils.nmap('ca', ':lua require("lspsaga.codeaction").code_action()<CR>')
utils.vmap('ca', ':lua require("lspsaga.codeaction").range_code_action()<CR>')

-- Show definition and references
utils.nmap('gh', ':lua require("lspsaga.provider").lsp_finder()<CR>')

-- List references
utils.nmap('gR', ':TroubleToggle lsp_references<CR>')

-- Hover
utils.nmap('K', ':lua require("lspsaga.hover").render_hover_doc()<CR>')

-- Rename
utils.nmap('gr', ':lua require("lspsaga.rename").rename()<CR>')

-- Jump between warnings/errors
utils.nmap('<C-]>', ':lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')
utils.nmap('<C-[>', ':lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')


local on_attach = function(client, bufnr)
	local function nmap(...) vim.api.nvim_buf_set_keymap(bufnr, 'n', ...) end
	local function opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	local opts = { noremap = true, silent = true }

	-- Set function to be used for auto-completion
	opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

	nmap('gd', ':lua vim.lsp.buf.definition()<CR>', opts)
	nmap('gD', ':lua vim.lsp.buf.declaration()<CR>', opts)

	-- Format document
	if client.resolved_capabilities.document_formatting then
		vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
	end

	vim.lsp.protocol.CompletionItemKind = {
		'', -- Text
		'', -- Method
		'', -- Function
		'', -- Constructor
		'', -- Field
		'', -- Variable
		'', -- Class
		'ﰮ', -- Interface
		'', -- Module
		'', -- Property
		'', -- Unit
		'', -- Value
		'', -- Enum
		'', -- Keyword
		'﬌', -- Snippet
		'', -- Color
		'', -- File
		'', -- Reference
		'', -- Folder
		'', -- EnumMember
		'', -- Constant
		'', -- Struct
		'', -- Event
		'ﬦ', -- Operator
		'', -- TypeParameter
	}
end

local make_config = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities.textDocument.completion.completionItem.preselectSupport = true
	capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
	capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
	capabilities.textDocument.completion.completionItem.deprecatedSupport = true
	capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
	capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			'documentation',
			'detail',
			'additionalTextEdits',
		},
	}

	return {
		capabilities = capabilities,
		on_attach = on_attach
	}
end

local M = {}

M.bootstrap = function()
	local lspconfig = require('lspconfig')
	local lspinstall = require('lspinstall')
	local lspsaga = require('lspsaga')
	local lspsignature = require('lsp_signature')

	lspinstall.setup()

	local servers = lspinstall.installed_servers()
	for _, server in pairs(servers) do
		local config = make_config()

		if server == 'lua'  then
			require('lsp.lua').extend_config(config)
		elseif server == 'php' then
			require('lsp.php').extend_config(config)
		elseif server == 'typescript' then
			require('lsp.typescript').extend_config(config)
		elseif server == 'html' then
			require('lsp.html').extend_config(config)
		elseif server == 'json' then
			require('lsp.json').extend_config(config)
		end

		lspconfig[server].setup(config)
	end

	require('lsp.null-ls').setup(on_attach)

	-- Automatically reload after a `:LspInstall <server>`
	lspinstall.post_install_hook = function()
		M.bootstrap()
		vim.cmd('bufdo e')
	end

	lspsaga.init_lsp_saga({
		code_action_prompt = { enable = false },
		border_style = 'round'
	})

	lspsignature.setup()
end

return M
