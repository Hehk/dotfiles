-- [nfnl] Compiled from after/plugin/sg.fnl by https://github.com/Olical/nfnl, do not edit.
local sg = require("sg")
sg.setup({})
return vim.keymap.set({"n"}, "<space>ss", "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>")
