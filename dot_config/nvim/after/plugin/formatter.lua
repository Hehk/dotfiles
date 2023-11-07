-- [nfnl] Compiled from after/plugin/formatter.fnl by https://github.com/Olical/nfnl, do not edit.
local f = require("formatter")
local filetypes = require("formatter.filetypes")
local defaults = require("formatter.defaults")
local rescript_formatter = {exe = "rescript", args = {"format", "$FILENAME"}, stdin = true}
local ocaml_formatter
local function _1_()
  return {exe = "ocamlformat", args = {"--enable-outside-detected-project", util.escape_path(nvim.buf_get_name())}, stdin = true}
end
ocaml_formatter = _1_
local swift_format = {exe = "swiftformat", args = {"stdin", "$FILENAME"}, stdin = true}
local formatters
local function _2_()
  return {exe = "fnlfmt", args = {vim.api.nvim_buf_get_name(0)}, stdin = true}
end
formatters = {fennel = _2_, ocaml = ocaml_formatter, go = filetypes.go.gofmt, typescript = defaults.prettier, typescriptreact = defaults.prettier, javascript = defaults.prettier, javascriptreact = defaults.prettier, json = defaults.prettier, css = defaults.prettier, scss = defaults.prettier, html = defaults.prettier, markdown = defaults.prettier, rust = defaults.rustfmt, python = filetypes.python.black, rescript = rescript_formatter, lua = filetypes.lua.stylua, swift = swift_format}
f.setup({logging = true, log_level = vim.log.levels.DEBUG, filetype = formatters})
vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>", {noremap = true})
return vim.keymap.set("n", "<leader>F", "<cmd>FormatWrite<cr>", {noremap = true})
