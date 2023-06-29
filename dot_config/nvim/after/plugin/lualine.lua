require("lualine").setup({
	options = {
		theme = "kanagawa",
	},
	component_separators = { left = "", right = "" },
	section_separators = { left = "", right = "" },
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "diagnostics" },
		lualine_y = {},
		lualine_z = {},
	},
})
