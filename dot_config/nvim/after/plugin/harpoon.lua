local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local function noremap(key, command)
	return vim.keymap.set("n", key, command, { noremap = true })
end

noremap("<leader>a", mark.add_file)
noremap("<C-e>", ui.toggle_quick_menu)
noremap("<leader>hc", mark.clear_all)

noremap("<C-h>", function()
	return ui.nav_file(1)
end)

noremap("<C-j>", function()
	return ui.nav_file(2)
end)

noremap("<C-k>", function()
	return ui.nav_file(3)
end)

noremap("<C-l>", function()
	return ui.nav_file(4)
end)
