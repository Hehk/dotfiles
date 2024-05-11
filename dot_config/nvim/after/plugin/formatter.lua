local util = require("formatter.util")
local filetypes = require("formatter.filetypes")
local defaults = require("formatter.defaults")

local function toFn(x)
	return function()
		return x
	end
end
local formatters = {
	fennel = { exe = "fnlfmt", args = { vim.api.nvim_buf_get_name(0) }, stdin = true },
	ocaml = toFn({
		exe = "ocamlformat",
		args = { "--enable-outside-detected-project", util.escape_path(util.get_current_buffer_file_path()) },
		stdin = true,
	}),
	go = filetypes.go.gofmt,
	typescript = defaults.biome,
	typescriptreact = defaults.biome,
	javascript = defaults.biome,
	javascriptreact = defaults.biome,
	json = defaults.biome,
	css = defaults.biome,
	scss = defaults.biome,
	html = defaults.biome,
	markdown = defaults.biome,
	rust = defaults.rustfmt,
	python = filetypes.python.black,
	rescript = toFn({ exe = "rescript", args = { "format", "$FILENAME" }, stdin = true }),
	lua = filetypes.lua.stylua,
	swift = toFn({ exe = "swiftformat", args = { "stdin", "$FILENAME" }, stdin = true }),
	haskell = toFn({
		exe = "ormolu",
		args = {
			"--stdin-input-file",
			vim.api.nvim_buf_get_name(0),
		},
		stdin = true,
	}),
  c = filetypes.c.clangformat,
}

require("formatter").setup({ logging = true, log_level = vim.log.levels.DEBUG, filetype = formatters })
vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>", { noremap = true })
vim.keymap.set("n", "<leader>F", "<cmd>FormatWrite<cr>", { noremap = true })
