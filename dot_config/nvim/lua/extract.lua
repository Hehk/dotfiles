-- Ripped directly from https://github.com/svermeulen/vim-cutlass
-- Converted to lua so it is easier for me to modify
--
-- Extract, makes x Extract out code and (or cut like C-x)

local function overrideSelectBindings()
	--  Add a map for every printable character to copy to black hole register
	--  I see no easier way to do this
	for i = 33, 126 do
		if i ~= 124 then
			local char = vim.fn.nr2char(i)
			if i == 92 then
				char = "\\"
			end
			vim.api.nvim_set_keymap("s", char, '<c-o>"_c' .. char, { noremap = true, silent = true })
		end
	end

	vim.api.nvim_set_keymap("s", "<bs>", '<c-o>"_c', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("s", " ", '<c-o>"_c ', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("s", "|", '<c-o>"_c|', { noremap = true, silent = true })
end

local function hasMapping(mapping, mode)
	return vim.fn.maparg(mapping, mode) ~= ""
end

local function addWeakMapping(left, right, modes, recursive)
	recursive = recursive or false
	for mode in modes:gmatch(".") do
		if not hasMapping(left, mode) then
			local opts = { noremap = not recursive, silent = true }
			vim.api.nvim_set_keymap(mode, left, right, opts)
		end
	end
end

local function overrideDeleteAndChangeBindings()
	local bindings = {
		{ "c", '"_c', "nx" },
		{ "cc", '"_S', "n" },
		{ "C", '"_C', "nx" },
		{ "s", '"_s', "nx" },
		{ "S", '"_S', "nx" },
		{ "d", '"_d', "nx" },
		{ "dd", '"_dd', "n" },
		{ "D", '"_D', "nx" },
		{ "x", '"_x', "nx" },
		{ "X", '"_X', "nx" },
	}

	for _, binding in ipairs(bindings) do
		addWeakMapping(binding[1], binding[2], binding[3])
	end
end

overrideDeleteAndChangeBindings()
overrideSelectBindings()

vim.keymap.set("n", "x", "d", { noremap = true })
vim.keymap.set("x", "x", "d", { noremap = true })
vim.keymap.set("n", "xx", "dd", { noremap = true })
vim.keymap.set("n", "X", "D", { noremap = true })
