-- [nfnl] Compiled from after/plugin/formatter.fnl by https://github.com/Olical/nfnl, do not edit.
local f = require("formatter")
local util = require("formatter.util")
local filetypes = require("formatter.filetypes")
local defaults = require("formatter.defaults")
local rescript_formatter = {exe = "rescript", args = {"format", "$FILENAME"}, stdin = true}
local ocaml_formatter
local function _1_()
  return {exe = "ocamlformat", args = {"--enable-outside-detected-project", util.escape_path(util.get_current_buffer_file_path())}, stdin = true}
end
ocaml_formatter = _1_
local swift_format = {exe = "swiftformat", args = {"stdin", "$FILENAME"}, stdin = true}
local formatters
local function _2_()
  return {exe = "fnlfmt", args = {vim.api.nvim_buf_get_name(0)}, stdin = true}
end
formatters = {fennel = _2_, ocaml = ocaml_formatter, go = filetypes.go.gofmt, typescript = defaults.biome, typescriptreact = defaults.biome, javascript = defaults.biome, javascriptreact = defaults.biome, json = defaults.biome, css = defaults.biome, scss = defaults.biome, html = defaults.biome, markdown = defaults.biome, rust = defaults.rustfmt, python = filetypes.python.black, rescript = rescript_formatter, lua = filetypes.lua.stylua, swift = swift_format}
f.setup({logging = true, log_level = vim.log.levels.DEBUG, filetype = formatters})
vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>", {noremap = true})
return vim.keymap.set("n", "<leader>F", "<cmd>FormatWrite<cr>", {noremap = true})
