if !has('nvim')
  echohl Error
  echom "This colorscheme requires Neovim"
  echohl None
  finish
endif

" Load the colorscheme
lua require('minimal').setup()
