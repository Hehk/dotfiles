(local rp-setup (require :rainbow-delimiters.setup))
(local rp (require :rainbow-delimiters))

(rp-setup.setup {:strategy {"" rp.strategy.noop
                            :clojure rp.strategy.global
                            :fennel rp.strategy.global
                            :dune rp.strategy.global}})

