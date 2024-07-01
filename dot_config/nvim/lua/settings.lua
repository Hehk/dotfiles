vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.scrolloff = 12
vim.opt.updatetime = 50
vim.opt.clipboard = "unnamed"

-- Quick fix list setting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function ()
    vim.cmd("wincmd L")
  end
})
