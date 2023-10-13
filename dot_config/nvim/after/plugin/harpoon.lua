-- [nfnl] Compiled from after/plugin/harpoon.fnl by https://github.com/Olical/nfnl, do not edit.
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local function noremap(key, command)
  return vim.keymap.set("n", key, command, {noremap = true})
end
noremap("<leader>a", mark.add_file)
noremap("<C-e>", ui.toggle_quick_menu)
noremap("<leader>hc", mark.clear_all)
local function _1_()
  return ui.nav_file(1)
end
noremap("<C-h>", _1_)
local function _2_()
  return ui.nav_file(2)
end
noremap("<C-j>", _2_)
local function _3_()
  return ui.nav_file(3)
end
noremap("<C-k>", _3_)
local function _4_()
  return ui.nav_file(4)
end
return noremap("<C-l>", _4_)
