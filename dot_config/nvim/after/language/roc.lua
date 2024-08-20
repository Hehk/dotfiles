vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.roc" },
	command = "set filetype=roc",
})

local parsers = require("nvim-treesitter.parsers").get_parser_configs()

parsers.roc = {
	install_info = {
		url = "https://github.com/faldor20/tree-sitter-roc",
		files = { "src/parser.c", "src/scanner.c" },
	},
}
