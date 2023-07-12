(module plugin.formatter {require {n neogit } autoload {nvim aniseed.nvim}})

(defn- noremap [from to]
  (nvim.set_keymap :n from to {:noremap true}))

(n.setup {})

