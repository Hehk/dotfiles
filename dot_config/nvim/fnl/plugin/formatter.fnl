(module plugin.formatter
        {require {util formatter.util
                  formatter formatter
                  defaults formatter.defaults}})

(local ocamlformat {:exe :ocamlformat
                    :args [:--enable-outside-detected-project
                           (util.escape_path (util.get_current_buffer_file_name))
                           :--inplace]
                    :stdin true})

(local formatters {:fennel (fn formatters.fnlfmt []
                             {:exe :fnlfmt
                              :args [(nvim.buf_get_name 0)]
                              :stdin true})
                   :ocaml ocamlformat
                   :go defaults.gofmt
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
                   :python defaults.black
                   :lua defaults.lua_format})

(formatter.setup {:log_level vim.log.levels.WARN :filetype formatters})
(vim.keymap.set :n :<leader>f :<cmd>Format<cr> {:noremap true})
(vim.keymap.set :n :<leader>F :<cmd>FormatWrite<cr> {:noremap true})

