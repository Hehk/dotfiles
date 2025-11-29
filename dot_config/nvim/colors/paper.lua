-- paper.lua - A minimal colorscheme with no syntax highlighting
-- All colors set to black for building custom themes incrementally

-- Reset all highlighting to defaults first
vim.cmd('highlight clear')

-- Set the colorscheme name
vim.g.colors_name = 'paper'

-- Load the lush colorscheme
require('lush')(require('lush_theme.paper'))
