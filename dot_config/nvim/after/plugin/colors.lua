local auto_dark_mode = require("auto-dark-mode")

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
auto_dark_mode.setup({
	update_interval = 1000,
	set_dark_mode = function()
		SetColors("zenbones", "dark")
	end,
	set_light_mode = function()
		SetColors("zenbones", "light")
	end,
})
