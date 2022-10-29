vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init-packer.lua source <afile> | PackerSync
  augroup end
]])

-- Pluggins
return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- tpope's stuff
	use("tpope/vim-surround")
	use("tpope/vim-commentary") -- Commenting made easy
	use("tpope/vim-unimpaired") -- Using for only :cnext and :cprevious
	use("tpope/vim-fugitive") -- Git wrapper. Mostly using for commits and puhsing stuff

	use("nvim-lua/plenary.nvim")
	use("jiangmiao/auto-pairs")
	use("wellle/targets.vim") -- provides additional text objects
	use("nvim-lualine/lualine.nvim")
	use("norcalli/nvim-colorizer.lua")

	-- Color schemes
	use({
		"ellisonleao/gruvbox.nvim",
		config = function()
			vim.cmd("colorscheme gruvbox")
		end,
	})
	-- use({
	-- 	"rose-pine/neovim",
	-- 	as = "rose-pine",
	-- 	config = function()
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- })

	-- Telescope and harpoon for SPEEEED
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = {
			"nvim-telescope/telescope-github.nvim",
		},
	})
	use("ThePrimeagen/harpoon")

	-- Git stuff
	use("lewis6991/gitsigns.nvim") -- Mostly using for quick diff and blame toggle

	-- LSP and autocompletion stuff
	use("neovim/nvim-lspconfig") -- configurations for Nvim LSP
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp") -- neovim builtin LSP client completion source for nvim-cmp
	use("L3MON4D3/LuaSnip") -- Snippet engine for neovim
	use("saadparwaiz1/cmp_luasnip") -- luasnip completion source for nvim-cmp

	use("jose-elias-alvarez/null-ls.nvim") -- Formatting & linting stuff

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- File explorer | looking for alternatives
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Auto close and auto rename html tag
	use({
		"windwp/nvim-ts-autotag",
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		}),
	})

	-- Generate function annotations
	use({
		"danymat/neogen",
		config = function()
			require("neogen").setup({})
		end,
	})

	-- Discord rich presence
	use("andweeb/presence.nvim")

	-- Peek lines as you type the line number
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})

	-- Floating term | might remove letter dont use it much
	use({ "akinsho/toggleterm.nvim", tag = "*" })
end)
