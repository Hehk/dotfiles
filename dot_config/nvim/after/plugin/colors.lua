require("kanagawa").setup({
	colors = {
		theme = {
			all = {
				ui = {
					bg_gutter = "none",
				},
			},
		},
	},
})

local function SetColors(color, background)
	color = (color or "kanagawa-dragon")
	background = (background or "dark")

	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.numberwidth = 2
	vim.opt.termguicolors = true
	vim.opt.background = background
	vim.wo.signcolumn = "no"
	vim.wo.foldcolumn = "0"
	vim.cmd.colorscheme(color)
end

SetColors()
