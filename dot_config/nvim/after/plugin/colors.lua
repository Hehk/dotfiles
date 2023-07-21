if vim.g.vscode then
	return
end

require('rose-pine').setup({
	variant = 'dawn',
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
	},

	respect_default_highlight_groups = true,
})

function SetColors(color, background)
	color = color or "rose-pine"
  background = background or "light"

	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.numberwidth = 4
	vim.opt.termguicolors = true
  vim.opt.background = background

	vim.cmd.colorscheme(color)
end

SetColors()
