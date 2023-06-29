(module plugin.formatter {require {util formatter.util formatter formatter}})

; (formatter.setup {:log_level vim.log.levels.WARN
;                   :filetype {:fennel (fn formatters.fnlfmt []
;                                        {:exe :fnlfmt
;                                         :args [(nvim.buf_get_name 0)]
;                                         :stdin true})}})

