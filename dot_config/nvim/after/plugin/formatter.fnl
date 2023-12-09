(local f (require :formatter))
(local util (require :formatter.util))
(local filetypes (require :formatter.filetypes))
(local defaults (require :formatter.defaults))

(local rescript-formatter {:exe :rescript :args [:format :$FILENAME] :stdin true})
(local ocaml-formatter (fn []
               {:exe :ocamlformat
                :args [:--enable-outside-detected-project (util.escape_path (util.get_current_buffer_file_path))]
                :stdin true}))
(local swift-format {:exe :swiftformat :args [:stdin :$FILENAME] :stdin true})

(local formatters {:fennel (fn []
                             {:exe :fnlfmt
                              :args [(vim.api.nvim_buf_get_name 0)]
                              :stdin true})
                   :ocaml ocaml-formatter
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
                   :rescript rescript-formatter
                   :lua filetypes.lua.stylua
                   :swift swift-format})

(f.setup {:logging true :log_level vim.log.levels.DEBUG :filetype formatters})

(vim.keymap.set :n :<leader>f :<cmd>Format<cr> {:noremap true})
(vim.keymap.set :n :<leader>F :<cmd>FormatWrite<cr> {:noremap true})
