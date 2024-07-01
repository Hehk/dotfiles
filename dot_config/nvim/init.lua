vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("tpope/vim-surround")
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-fugitive")
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})

	use("nvim-telescope/telescope.nvim")
	use({ "nvim-treesitter/nvim-treesitter", {
		run = ":TSUpdate",
	} })
	use("nvim-treesitter/nvim-treesitter-context")

	use("ThePrimeagen/harpoon")
	use("mbbill/undotree")

	use({
		"supermaven-inc/supermaven-nvim",
		config = function()
		end,
	})
	use("folke/trouble.nvim")
	use("nvim-lualine/lualine.nvim")
	use("stevearc/oil.nvim")

	-- Colorschemes
	use("rebelot/kanagawa.nvim")
	use({ "kepano/flexoki-neovim", as = "flexoki" })
  use("rktjmp/lush.nvim")

	-- Language tools
	use("mhartington/formatter.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		disable = vim.g.vscode,
		requires = {
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
	})

  -- Lanugae specific tools
	use("mrcjkb/haskell-tools.nvim")
	use("rescript-lang/vim-rescript")
	use("fatih/vim-go")
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("typescript-tools").setup({})
		end,
	})
end)

require("remap")
require("settings")
require("extract")
