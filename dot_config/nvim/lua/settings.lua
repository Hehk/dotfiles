vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 12
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamed"

-- Quick fix list setting
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.cmd("wincmd L")
	end,
})

vim.diagnostic.config({
	virtual_text = {
		-- Truncate virtual text to prevent overflow
		prefix = "",
		spacing = 4,
		source = "if_many",
		format = function(diagnostic)
			local message = diagnostic.message:gsub("\n", " ")
			if #message > 80 then
				return message:sub(1, 77) .. "..."
			end
			return message
		end,
	},
	float = {
		border = "rounded",
		source = "always",
		-- header = "",
		-- prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Highlighting the cursor line and column
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Additional diagnostic keybindings for better workflow
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error details" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to location list" })
