if vim.g.vscode then
	return
end

local telescope = require("telescope")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})

telescope.load_extension("harpoon")
