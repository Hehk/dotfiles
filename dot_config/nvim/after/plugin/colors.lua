if vim.g.vscode then
	return
end

local function twoFirewatchModifications()
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "background" })
end

function SetColors(color, background)
	color = color or "two-firewatch"
  background = background or "dark"

	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.numberwidth = 2
	vim.opt.termguicolors = true
  vim.opt.background = background
  vim.wo.signcolumn = "no"
  vim.wo.foldcolumn = "0"

	vim.cmd.colorscheme(color)
  if color == "two-firewatch" then
    twoFirewatchModifications()
  end
end

SetColors()
