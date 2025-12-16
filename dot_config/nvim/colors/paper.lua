-- paper.lua - A minimal colorscheme with no syntax highlighting
-- All colors set to black for building custom themes incrementally

vim.cmd("highlight clear")
vim.g.colors_name = "paper"
require("lush")(require("lush_theme.paper"))

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		if vim.g.colors_name == "paper" then
			package.loaded["lush_theme.paper"] = nil
			vim.cmd("colorscheme paper")
		end
	end,
})
