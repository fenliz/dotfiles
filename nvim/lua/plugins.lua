local packer = require('utils.packer')

local config = {
	display = {
		open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  },
}

local function plugins(use)
	-- Package manager
	use({ 'wbthomason/packer.nvim', opt = true })

	-- Language server
	use({ 'neovim/nvim-lspconfig',
		requires = {
			'kabouzeid/nvim-lspinstall',
			'glepnir/lspsaga.nvim',
			'nvim-lua/plenary.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'ray-x/lsp_signature.nvim'
		},
		config = function() require('lsp').bootstrap() end
	})

	-- Syntax highlighting
	use({ 'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			'RRethy/nvim-treesitter-textobjects',
			'JoosepAlviste/nvim-ts-context-commentstring',
			'nvim-treesitter/playground'
		},
		config = function() require('highlighting').bootstrap() end
	})

	-- Finder
	use({ 'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim'
		},
		config = function() require('finder').bootstrap() end
	})

	-- Code completion
	use({ 'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function() require('completion').bootstrap() end
	})

	-- File explorer
	use({ 'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require('explorer').bootstrap() end
	})

	-- Diagnostics list
	use({ 'folke/trouble.nvim',
		config = function() require('problems').bootstrap() end
	})

	-- Git
	use({ 'TimUntersberger/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'lewis6991/gitsigns.nvim',
		},
		config = function() require('git').bootstrap() end
	})

	-- Debugging
	use({ 'mfussenegger/nvim-dap',
		requires = {
			'Pocco81/DAPInstall.nvim',
			'nvim-telescope/telescope-dap.nvim',
			'theHamsta/nvim-dap-virtual-text'
		},
		config = function() require('debugging').bootstrap() end
	})

	-- Testing
	-- use({ 'rcarriga/vim-ultest',
	-- 	requires = 'vim-test/vim-test',
	-- 	run = ':UpdateRemotePlugins',
	-- 	config = function() require('testing').bootstrap() end
	-- })

	-- Commands
	use({ 'folke/which-key.nvim',
		config = function() require('commands').bootstrap() end
	})

	-- Color theme
	use({ 'folke/tokyonight.nvim',
		requires = 'hoob3rt/lualine.nvim',
		config = function() require('theme').bootstrap() end
	})

	-- Color highlight
	use({ 'norcalli/nvim-colorizer.lua',
		config = function() require('colorizer').setup() end
	})

	-- Navigation
	use({ 'ggandor/lightspeed.nvim' })

	-- Editorconfig
	use({ 'sgur/vim-editorconfig' })

	-- Comments
	use({ 'tpope/vim-commentary' })

	-- Surround motions
	use({ 'tpope/vim-surround' })

	-- Indentation guides
	use({ 'lukas-reineke/indent-blankline.nvim' })
end

return packer.setup(config, plugins)
