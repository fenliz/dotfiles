local o = vim.o

-- Code completion
o.completeopt = 'menu,menuone,noselect'

-- Faster completion
o.updatetime = 300

local M = {}

M.bootstrap = function()
	local cmp = require('cmp')
	local luasnip = require('luasnip')
	local fn = vim.fn

	local check_backspace = function()
		local col = fn.col '.' - 1
		return col == 0 or fn.getline('.'):sub(col, col):match '%s' ~= nil
	end

	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end

	cmp.setup({
		mapping = {
			['<C-p>'] = cmp.mapping.select_prev_item(),
			['<C-n>'] = cmp.mapping.select_next_item(),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			}),

			['<Tab>'] = cmp.mapping(function(fallback)
				if fn.pumvisible() == 1 then
					fn.feedkeys(t('<C-n>'), 'n')
				elseif luasnip.expand_or_jumpable() then
					fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
				elseif check_backspace() then
					fn.feedkeys(t('<Tab>'), 'n')
				else
					fallback()
				end
			end, { 'i', 's' }),
			['<S-Tab>'] = cmp.mapping(function(fallback)

				if fn.pumvisible() == 1 then
					fn.feedkeys(t('<C-p>'), 'n')
				elseif luasnip.jumpable(-1) then
					fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
				else
					fallback()
				end
			end, { 'i', 's' }),
		},

		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end
		},

		sources = {
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
			{ name = 'buffer' },
		}
	})

	require('snippets')
end

return M
