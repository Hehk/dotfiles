local function noremap(from, to)
  return vim.api.nvim_set_keymap("n", from, to, {noremap = true})
end
vim.g.mapleader = " "
vim.g.maplocalleader = ","
noremap("<C-d>", "<C-d>zz")
noremap("<C-u>", "<C-u>zz")
noremap("n", "nzzzv")
noremap("N", "Nzzzv")
noremap("<leader>k", "<cmd>lnext<CR>zz")
noremap("<leader>j", "<cmd>lprev<CR>zz")
noremap("Q", "<nop>")
