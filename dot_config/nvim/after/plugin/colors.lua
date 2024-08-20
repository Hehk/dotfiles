local function SetColors(color, background)
	color = (color or "zenwritten")
	background = (background or "light")

	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.termguicolors = true
	vim.opt.background = background
	vim.wo.signcolumn = "yes"
	vim.wo.foldcolumn = "0"
	vim.o.termguicolors = true
	vim.cmd.colorscheme(color)
end

SetColors()
