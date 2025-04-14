
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

local format_on_save = true
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		if format_on_save then
			require("conform").format({ bufnr = args.buf, lsp_fallback = true, quiet = true })
		end
	end,
})

vim.keymap.set("n", "tf", function()
	format_on_save = not format_on_save
	print("Format on save: " .. (format_on_save and "enabled" or "disabled"))
end, { noremap = true, silent = false })
