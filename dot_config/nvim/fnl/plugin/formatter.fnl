(module plugin.formatter {require {f formatter
                                   defaults formatter.defaults
                                   filetypes formatter.filetypes
                                   nvim aniseed.nvim}})

(local formatters {:fennel (fn []
                             {:exe :fnlfmt
                              :args [(nvim.buf_get_name 0)]
                              :stdin true})
                   :ocaml filetypes.ocaml.ocamlformat
                   :go filetypes.go.gofmt
                   :typescript defaults.prettier
                   :typescriptreact defaults.prettier
                   :javascript defaults.prettier
                   :javascriptreact defaults.prettier
                   :json defaults.prettier
                   :css defaults.prettier
                   :scss defaults.prettier
                   :html defaults.prettier
                   :markdown defaults.prettier
                   :rust defaults.rustfmt
                   :python filetypes.python.black
                   :lua defaults.lua_format})

(f.setup {:logging true :log_level vim.log.levels.DEBUG :filetype formatters})

(vim.keymap.set :n :<leader>f :<cmd>Format<cr> {:noremap true})
(vim.keymap.set :n :<leader>F :<cmd>FormatWrite<cr> {:noremap true})

