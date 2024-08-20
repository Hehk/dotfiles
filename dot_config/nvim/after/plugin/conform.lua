require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "biome", "prettierd", "prettier" } },
		javascriptreact = { { "biome", "prettierd", "prettier" } },
		typescript = { "biome", "prettierd", "prettier" },
		typescriptreact = { "biome", "prettierd", "prettier" },
		clojure = { "cljfmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_fallback = true, quiet = true })
	end,
})
