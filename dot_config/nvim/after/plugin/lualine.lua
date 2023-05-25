if vim.g.vscode then
	return
end

require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "kanagawa",
		component_separators = { "", "" },
		section_separators = { "", "" },
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { {"filename", file_status = true }, { "diagnostics", sources = { "nvim_lsp" } } },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "branch" },
	},
})
