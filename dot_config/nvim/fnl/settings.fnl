(module settings {require {nvim aniseed.nvim
                           nu aniseed.nvim.util
                           core aniseed.core}})

;; All the general settings that it does not make sense to
;; put in a separate module

(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(set vim.opt.nu true)
(set vim.opt.relativenumber true)

(set vim.opt.tabstop 2)
(set vim.opt.shiftwidth 2)
(set vim.opt.softtabstop 2)
(set vim.opt.expandtab true)
(set vim.opt.smartindent true)
(set vim.opt.wrap true)

(set vim.opt.swapfile false)
(set vim.opt.backup false)
(set vim.opt.undofile true)

(set vim.opt.hlsearch true)
(set vim.opt.incsearch true)

(set vim.opt.scrolloff 12)
; (set vim.opt.isfname (concat (get vim.opt.isfname 0) "@-@"))

(set vim.opt.updatetime 50)
(set vim.opt.clipboard :unnamed)

