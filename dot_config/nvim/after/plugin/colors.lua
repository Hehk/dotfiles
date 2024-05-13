function SetupFlexoki(background)
	local c = require("flexoki.palette").palette()

	require("flexoki").colorscheme({
		variant = background,
		highlight_groups = {
			["String"] = { fg = "None", bg = "None" },
			["Constant"] = { fg = "None", bg = "None" },
      ["Identifier"] = { fg = "None", bg = "None" },
      ["Comment"] = { fg = c.gray, bg = "None" },
		},
	})
end

local function SetColors(color, background)
	color = (color or "flexoki")
	background = (background or "light")

	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.termguicolors = true
	vim.opt.background = background
	vim.wo.signcolumn = "no"
	vim.wo.foldcolumn = "0"
	vim.o.termguicolors = true
	if string.find(color, "flexoki") then
		SetupFlexoki(background)
	else
		vim.cmd.colorscheme(color)
	end
end

SetColors()
