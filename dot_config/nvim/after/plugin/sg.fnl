(local sg (require :sg))

(sg.setup {})

(vim.keymap.set [:n] :<space>ss "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>")
