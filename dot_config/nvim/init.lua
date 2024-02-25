vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "svermeulen/vim-cutlass" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-commentary" })
	use({ "tpope/vim-repeat" })
	use({ "tpope/vim-fugitive" })

	use({ "nvim-telescope/telescope.nvim", disable = vim.g.vscode })
	use({ "nvim-treesitter/nvim-treesitter", disable = vim.g.vscode, {
		run = ":TSUpdate",
	} })
	use({ "nvim-treesitter/nvim-treesitter-context", disable = vim.g.vscode })

	use({ "ThePrimeagen/harpoon", disable = vim.g.vscode })
	use({ "mbbill/undotree", disable = vim.g.vscode })

	use({ "github/copilot.vim", disable = vim.g.vscode })
	use({ "sourcegraph/sg.nvim", run = "nvim -l build/init.lua" })

	use({ "folke/trouble.nvim", disable = vim.g.vscode })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		disable = vim.g.vscode,
		requires = {
			{ "neovim/nvim-lspconfig", disable = vim.g.vscode },
			{
				"williamboman/mason.nvim",
				disable = vim.g.vscode,
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim", disable = vim.g.vscode },
			{ "hrsh7th/nvim-cmp", disable = vim.g.vscode },
			{ "hrsh7th/cmp-nvim-lsp", disable = vim.g.vscode },
			{ "L3MON4D3/LuaSnip", disable = vim.g.vscode },
		},
	})
	use("nvim-lualine/lualine.nvim")
	use({ "mhartington/formatter.nvim", disable = vim.g.vscode })
	use({ "stevearc/oil.nvim", disable = vim.g.vscode })
	use("Olical/nfnl")
	use("fatih/vim-go")
	use({
		"mcchrish/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		requires = "rktjmp/lush.nvim",
	})
  use("hiphish/rainbow-delimiters.nvim")
end)

require("remap")
require("settings")
