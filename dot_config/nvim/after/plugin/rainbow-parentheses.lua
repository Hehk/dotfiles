-- [nfnl] Compiled from after/plugin/rainbow-parentheses.fnl by https://github.com/Olical/nfnl, do not edit.
local rp_setup = require("rainbow-delimiters.setup")
local rp = require("rainbow-delimiters")
return rp_setup.setup({strategy = {[""] = rp.strategy.noop, clojure = rp.strategy.global, fennel = rp.strategy.global, dune = rp.strategy.global}})
