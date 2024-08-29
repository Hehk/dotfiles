require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "biome", "prettierd", "prettier", stop_after_first = true } },
		javascriptreact = { { "biome", "prettierd", "prettier", stop_after_first = true } },
		typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
		clojure = { "cljfmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf, lsp_fallback = true, quiet = true })
	end,
})
