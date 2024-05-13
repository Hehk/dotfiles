local util = require("formatter.util")
local filetypes = require("formatter.filetypes")
local defaults = require("formatter.defaults")

local function f(x)
	return function()
		return x
	end
end

local formatters = {
	fennel = { exe = "fnlfmt", args = { vim.api.nvim_buf_get_name(0) }, stdin = true },
	ocaml = defaults.ocamlformat,
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
	rust = filetypes.rust.rustfmt,
	python = filetypes.python.black,
	rescript = f({ exe = "rescript", args = { "format", "-stdin", ".res", "$FILENAME" }, stdin = true }),
	lua = filetypes.lua.stylua,
	swift = f({ exe = "swiftformat", args = { "stdin", "$FILENAME" }, stdin = true }),
	haskell = f({
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
