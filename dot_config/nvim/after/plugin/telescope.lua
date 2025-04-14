local telescope = require("telescope")
telescope.setup({
  defaults = {
    path_display = 'shorten',
  },
})

local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local function find_files()
  local dropdown = themes.get_dropdown({ shorten_path = true, previewer = false })
	return builtin.find_files(dropdown)
end
vim.keymap.set("n", "<leader>pf", find_files, {})

local function git_files()
  local opts = themes.get_dropdown({ shorten_path = true, previewer = false })
  opts.show_untracked = true
	return builtin.git_files(opts)
end
vim.keymap.set("n", "<C-p>", git_files, {})

return vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
