-- paper.lua - A minimal colorscheme with no syntax highlighting
-- All colors set to black for building custom themes incrementally

vim.cmd("highlight clear")
vim.g.colors_name = "paper"
require("lush")(require("lush_theme.paper"))

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = function()
		if vim.g.colors_name == "paper" and not vim.g._paper_reloading then
			vim.g._paper_reloading = true
			package.loaded["lush_theme.paper"] = nil
			vim.cmd("colorscheme paper")
			vim.g._paper_reloading = nil
		end
	end,
})
