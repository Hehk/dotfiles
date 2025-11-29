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
  callback = function()
    vim.cmd("wincmd L")
  end
})

-- Diagnostic configuration
-- NOTE: For OCaml projects, diagnostics require 'dune build' to be run first.
-- For real-time diagnostics, run 'dune build -w' in a separate terminal.
vim.diagnostic.config({
  virtual_text = true,           -- Show inline diagnostic messages
  float = true,                  -- Enable floating diagnostic windows
  signs = true,                  -- Show signs in the gutter
  underline = true,              -- Underline diagnostic locations
  update_in_insert = false,      -- Don't update diagnostics while typing
  severity_sort = true,          -- Sort by severity (errors first)
})

-- Highlighting the cursor line and column
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
