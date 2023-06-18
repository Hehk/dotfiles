vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "svermeulen/vim-cutlass" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-commentary" })
	use({
		"phaazon/hop.nvim",
		branch = "v2",
	})
	use({
		"folke/which-key.nvim",
		disable = vim.g.vscode,
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({ "nvim-telescope/telescope.nvim", disable = vim.g.vscode })
	use({ "nvim-treesitter/nvim-treesitter", disable = vim.g.vscode, {
		run = ":TSUpdate",
	} })
	use({ "nvim-treesitter/nvim-treesitter-context", disable = vim.g.vscode })
	use({ "nvim-treesitter/playground", disable = vim.g.vscode })

	use({ "ThePrimeagen/harpoon", disable = vim.g.vscode })
	use({ "mbbill/undotree", disable = vim.g.vscode })
	use({ "tpope/vim-fugitive", disable = vim.g.vscode })
	use({ "github/copilot.vim", disable = vim.g.vscode })
	use({ "rebelot/kanagawa.nvim", disable = vim.g.vscode })
	use({ "catppuccin/nvim", disable = vim.g.vscode })
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		disable = vim.g.vscode,
	})

	use({
		"sourcegraph/sg.nvim",
		run = "cargo build --workspace",
		requires = { "nvim-lua/plenary.nvim" },
		disable = vim.g.vscode,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})
	use("nvim-lualine/lualine.nvim")
	use("mhartington/formatter.nvim")
	use("stevearc/oil.nvim")
	use("rakr/vim-two-firewatch")
	use({ "rose-pine/neovim", as = "rose-pine" })
  use({ "atelierbram/Base2Tone-nvim" })
end)
