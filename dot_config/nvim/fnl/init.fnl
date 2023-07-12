(module init {require {nvim aniseed.nvim} autoload {core aniseed.core}})

(defn- glob [path]
  (nvim.fn.glob path true true true))

(local config-path (nvim.fn.stdpath :config))

; (->> (glob (.. config-path :/lua/plugin/*.lua))
;      (core.run! (fn [path] (.. :plugin/ (nvim.fn.fnamemodify path ":t:r"))))
;      (core.run! require))

; TODO Figure out a way to do this automatically
(require :remap)
(require :settings)

(require :plugin/formatter)
(require :plugin/harpoon)
(require :plugin/neogit)

