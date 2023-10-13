(local mark (require :harpoon.mark))
(local ui (require :harpoon.ui))

(fn noremap [key command]
  (vim.keymap.set :n key command {:noremap true}))

(noremap :<leader>a mark.add_file)
(noremap :<C-e> ui.toggle_quick_menu)
(noremap :<leader>hc mark.clear_all)
(noremap :<C-h> (fn [] (ui.nav_file 1)))
(noremap :<C-j> (fn [] (ui.nav_file 2)))
(noremap :<C-k> (fn [] (ui.nav_file 3)))
(noremap :<C-l> (fn [] (ui.nav_file 4)))

