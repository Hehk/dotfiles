local function SetColors(color, background)
	color = (color or "flexoki-light")
	background = (background or "light")

	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.termguicolors = true
	vim.opt.background = background
	vim.wo.signcolumn = "no"
	vim.wo.foldcolumn = "0"
  vim.o.termguicolors = true
	vim.cmd.colorscheme(color)
end

SetColors()
