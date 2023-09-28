(module plugin.telescope {require { nvim aniseed.nvim}})

(defn noremap [key command]
  (vim.keymap.set :n key command {:noremap true}))

(defn xnoremap [key command]
  (vim.keymap.set :x key command {:noremap true}))

(noremap :<leader>r :MagmaEvaluateOperator<CR>)
(noremap :<leader>rr :MagmaEvaluateLine<CR>)
(xnoremap :<leader>r :<C-u>MagmaEvaluateVisual<CR>)
(noremap :<leader>rc :MagmaReevaluateCell<CR>)
(noremap :<leader>rd :MagmaDelete<CR>)
(noremap :<leader>ro :MagmaShowOutput<CR>)


; nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
; nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
; xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
; nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
; nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
; nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

(set vim.g.magma_automatically_open_output false)
(set vim.g.magma_image_provider "ueberzug")

; let g:magma_automatically_open_output = v:false
; let g:magma_image_provider = "ueberzug"
