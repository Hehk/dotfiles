(module plugin.harpoon {autoload {mark harpoon.mark
                                  ui harpoon.ui
                                  nvim aniseed.nvim}})

(defn- call
  [action]
  (fn []
    (vim.api.nvim_command (concat "call VSCodeNotify(\"" action "\")"))))

(defn noremap [key command]
  (vim.keymap.set :n key command {:noremap true}))

(defn- bind [key action]
  (noremap key (call action)))


(when (vim.g.vscode)
  (bind :<leader>a :vscode-harpoon.addEditor)
  (bind :<C-e> :vscode-harpoon.editorQuickPick)
  (bind :<C-h> :vscode-harpoon.gotoEditor1)
  (bind :<C-j> :vscode-harpoon.gotoEditor2)
  (bind :<C-k> :vscode-harpoon.gotoEditor3)
  (bind :<C-l> :vscode-harpoon.gotoEditor4))

(when (not vim.g.vscode)
  (noremap :<leader>a harpoon.mark.add_file)
  (noremap :<C-e> harpoon.ui.toggle_quick_menu)
  (noremap :<leader>hc harpoon.mark.clear_all)
  (noremap :<C-h> (fn [] (harpoon.ui.nav_file 1)))
  (noremap :<C-j> (fn [] (harpoon.ui.nav_file 2)))
  (noremap :<C-k> (fn [] (harpoon.ui.nav_file 3)))
  (noremap :<C-l> (fn [] (harpoon.ui.nav_file 4))))

