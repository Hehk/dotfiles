if vim.g.vscode then
	return
end

local function minimalTheme()
end

function SetColors(color, background)
	color = color or "zenwritten"
  background = background or "light"

	require("kanagawa").setup({
		commentStyle = { italic = true },
		theme = "dragon",
		background = {
			dark = "dragon",
			light = "lotus",
		},
		overrides = function(colors)
			local theme = colors.theme
			return {
				NormalFloat = { bg = "none" },
				FloatBorder = { bg = "none" },
				FloatTitle = { bg = "none" },

				Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
				PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
				PmenuSbar = { bg = theme.ui.bg_m1 },
				PmenuThumb = { bg = theme.ui.bg_p2 },

				NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
				MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

				-- TelescopeTitle = { fg = theme.ui.special, bold = true },
				-- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
				-- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
				-- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
				-- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
				-- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
				-- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

				TreesitterContextLineNumber = { bg = theme.ui.bg_p1, fg = theme.ui.fg_dim },
				TreesitterContext = { bg = theme.ui.bg_p1, fg = theme.ui.fg_dim },
				CursorLine = { bg = theme.ui.bg_p1 },
				CursorLineNr = { bg = theme.ui.bg_p1 },
			}
		end,
	})


	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.numberwidth = 4
	vim.opt.termguicolors = true
  vim.opt.background = background

  if color == "minimal" then
    minimalTheme()
  else
	  vim.cmd.colorscheme(color)
  end
end

SetColors()
