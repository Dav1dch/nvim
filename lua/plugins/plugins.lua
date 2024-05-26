-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		'neovim/nvim-lspconfig'
	}
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
		tag = 'nightly'
	}
	use 'Mofiqul/dracula.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'rmagatti/alternate-toggler'
	use 'windwp/nvim-autopairs'
	use 'mg979/vim-visual-multi'
	use 'gcmt/wildfire.vim'
	use 'tpope/vim-surround'
	use {
		'tomasky/bookmarks.nvim',
		-- tag = 'release' -- To use the latest release
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	--  use 'hrsh7th/cmp-cmdline'
	use {
		'hrsh7th/nvim-cmp',
		"SirVer/ultisnips",
		"quangnguyen30192/cmp-nvim-ultisnips",
	}
	use 'onsails/lspkind.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'mhinz/vim-startify'
	use 'p00f/nvim-ts-rainbow'
	use 'numToStr/Comment.nvim'
	use "shellRaining/hlchunk.nvim"
	use "theniceboy/nvim-deus"
	use "lukas-reineke/indent-blankline.nvim"
	use { "catppuccin/nvim", as = "catppuccin" }
	use "ryanoasis/vim-devicons"
	use "preservim/nerdtree"
	use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
	use 'romgrk/barbar.nvim'
	use { 'folke/flash.nvim'
	}
end
)
