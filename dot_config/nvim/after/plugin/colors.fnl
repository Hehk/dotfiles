(fn SetColors [color background]
  (let [color (or color :zenbones)
        background (or background :light)]
    (set vim.opt.cursorline true)
    (set vim.opt.cursorcolumn true)
    (set vim.opt.numberwidth 2)
    (set vim.opt.termguicolors true)
    (set vim.opt.background background)
    (set vim.wo.signcolumn :no)
    (set vim.wo.foldcolumn :0)
    (vim.cmd.colorscheme color)
    (if (= color :two-firewatch)
        (vim.api.nvim_set_hl 0 :SignColumn {:bg :background}))))

(SetColors)

