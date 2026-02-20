local lush = require("lush")

--[[

The main idea for this theme is to have almost no syntax highlighting.
Supports light and dark variants with automatic detection.

Palettes can be selected via vim.g.paper_palette (e.g. "flexoki_light",
"flexoki_dark"). When unset, the palette is chosen automatically based
on vim.o.background.

]]

local palettes = {
	flexoki_light = {
		fg = "#100f0f", -- black (tx)
		bg = "#fffcf0", -- paper (bg)
		fg_alt = "#6f6e69", -- base-600 (tx-2)
		bg_alt = "#e6e4d9", -- base-100 (ui)
		cursor_line = "#f2f0e5", -- base-50  (bg-2)
		selection = "#cecdc3", -- base-200 (ui-3)
		border = "#b7b5ac", -- base-300 (tx-3)
		comment = "#6f6e69", -- base-600 (tx-2)
		delimiter = "#6f6e69", -- base-600 (tx-2)
	},
	flexoki_dark = {
		fg = "#cecdc3", -- base-200 (tx)
		bg = "#100f0f", -- black (bg)
		fg_alt = "#878580", -- base-500 (tx-2)
		bg_alt = "#343331", -- base-850 (ui)
		cursor_line = "#1c1b1a", -- base-950 (bg-2)
		selection = "#403e3c", -- base-800 (ui-2)
		border = "#575653", -- base-700 (ui-3)
		comment = "#878580", -- base-500 (tx-2)
		delimiter = "#878580", -- base-500 (tx-2)
	},
}

local palette_name = vim.g.paper_palette
if not palette_name then
	palette_name = vim.o.background == "dark" and "flexoki_dark" or "flexoki_light"
end
local colors = assert(palettes[palette_name], "paper: unknown palette " .. tostring(palette_name))

local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- Editor highlights
		Normal({ fg = colors.fg, bg = colors.bg }),
		NormalFloat({ fg = colors.fg, bg = colors.bg_alt }),
		NormalNC({ fg = colors.fg, bg = colors.bg }),

		-- UI Elements
		ColorColumn({ bg = colors.fg }),
		Conceal({ fg = colors.fg }),
		Cursor({ fg = colors.bg, bg = colors.fg }),
		lCursor({ Cursor }),
		CursorIM({ Cursor }),
		CursorColumn({ bg = colors.cursor_line }),
		CursorLine({ bg = colors.cursor_line }),
		Directory({ fg = colors.fg }),
		DiffAdd({ fg = colors.fg, bg = colors.bg }),
		DiffChange({ fg = colors.fg, bg = colors.bg }),
		DiffDelete({ fg = colors.fg, bg = colors.bg }),
		DiffText({ fg = colors.fg, bg = colors.bg }),
		EndOfBuffer({ fg = colors.fg }),
		TermCursor({ Cursor }),
		TermCursorNC({ fg = colors.fg, bg = colors.bg }),
		ErrorMsg({ fg = colors.fg, bg = colors.bg }),
		VertSplit({ fg = colors.border, bg = colors.bg }),
		WinSeparator({ VertSplit }),
		Folded({ fg = colors.fg, bg = colors.bg }),
		FoldColumn({ fg = colors.fg, bg = colors.bg }),
		SignColumn({ fg = colors.fg, bg = colors.bg }),
		IncSearch({ fg = colors.bg, bg = colors.fg }),
		Substitute({ IncSearch }),
		LineNr({ fg = colors.fg_alt, bg = colors.bg }),
		CursorLineNr({ fg = colors.fg, bg = colors.bg }),
		MatchParen({ fg = colors.fg, bg = colors.selection }),
		ModeMsg({ fg = colors.fg }),
		MsgArea({ Normal }),
		MsgSeparator({ fg = colors.fg, bg = colors.bg }),
		MoreMsg({ fg = colors.fg }),
		NonText({ fg = colors.fg_alt }),
		FloatBorder({ fg = colors.border, bg = colors.bg_alt }),
		Pmenu({ fg = colors.fg, bg = colors.bg_alt }),
		PmenuSel({ fg = colors.bg, bg = colors.fg }),
		PmenuSbar({ fg = colors.fg, bg = colors.bg_alt }),
		PmenuThumb({ fg = colors.fg, bg = colors.fg_alt }),
		Question({ fg = colors.fg }),
		QuickFixLine({ fg = colors.fg, bg = colors.selection }),
		Search({ fg = colors.bg, bg = colors.fg_alt }),
		SpecialKey({ fg = colors.fg_alt }),
		SpellBad({ fg = colors.fg, undercurl = false }),
		SpellCap({ fg = colors.fg, undercurl = false }),
		SpellLocal({ fg = colors.fg, undercurl = false }),
		SpellRare({ fg = colors.fg, undercurl = false }),
		StatusLine({ fg = colors.fg, bg = colors.bg_alt }),
		StatusLineNC({ fg = colors.fg_alt, bg = colors.bg_alt }),
		TabLine({ fg = colors.fg_alt, bg = colors.bg_alt }),
		TabLineFill({ fg = colors.fg_alt, bg = colors.bg_alt }),
		TabLineSel({ fg = colors.bg, bg = colors.fg }),
		Title({ fg = colors.fg }),
		Visual({ fg = colors.fg, bg = colors.selection }),
		VisualNOS({ Visual }),
		WarningMsg({ fg = colors.fg }),
		Whitespace({ fg = colors.fg_alt }),
		WildMenu({ PmenuSel }),

		Comment({ fg = colors.comment, italic = true }),
		Constant({ fg = colors.fg }),
		String({ fg = colors.fg }),
		Character({ fg = colors.fg }),
		Number({ fg = colors.fg }),
		Boolean({ fg = colors.fg }),
		Float({ fg = colors.fg }),
		Identifier({ fg = colors.fg }),
		Function({ fg = colors.fg }),
		Statement({ fg = colors.fg }),
		Conditional({ fg = colors.fg }),
		Repeat({ fg = colors.fg }),
		Label({ fg = colors.fg }),
		Operator({ fg = colors.fg }),
		Keyword({ fg = colors.fg }),
		Exception({ fg = colors.fg }),
		PreProc({ fg = colors.fg }),
		Include({ fg = colors.fg }),
		Define({ fg = colors.fg }),
		Macro({ fg = colors.fg }),
		PreCondit({ fg = colors.fg }),
		Type({ fg = colors.fg }),
		StorageClass({ fg = colors.fg }),
		Structure({ fg = colors.fg }),
		Typedef({ fg = colors.fg }),
		Special({ fg = colors.fg }),
		SpecialChar({ fg = colors.fg }),
		Tag({ fg = colors.fg }),
		Delimiter({ fg = colors.delimiter }),
		SpecialComment({ fg = colors.fg }),
		Debug({ fg = colors.fg }),
		Underlined({ fg = colors.fg, underline = false }),
		Ignore({ fg = colors.fg }),
		Error({ fg = colors.fg, bg = colors.bg }),
		Todo({ fg = colors.fg, bg = colors.bg }),

		-- Treesitter groups
		sym("@text")({ fg = colors.fg }),
		sym("@text.literal")({ fg = colors.fg }),
		sym("@text.reference")({ fg = colors.fg }),
		sym("@text.title")({ fg = colors.fg }),
		sym("@text.uri")({ fg = colors.fg }),
		sym("@text.underline")({ fg = colors.fg, underline = false }),
		sym("@text.todo")({ fg = colors.fg }),
		sym("@comment")({ fg = colors.comment, italic = true }),
		sym("@punctuation")({ fg = colors.delimiter }),
		sym("@punctuation.bracket")({ fg = colors.delimiter }),
		sym("@constant")({ fg = colors.fg }),
		sym("@constant.builtin")({ fg = colors.fg }),
		sym("@constant.macro")({ fg = colors.fg }),
		sym("@define")({ fg = colors.fg }),
		sym("@macro")({ fg = colors.fg }),
		sym("@string")({ fg = colors.fg }),
		sym("@string.escape")({ fg = colors.fg }),
		sym("@string.special")({ fg = colors.fg }),
		sym("@character")({ fg = colors.fg }),
		sym("@character.special")({ fg = colors.fg }),
		sym("@number")({ fg = colors.fg }),
		sym("@boolean")({ fg = colors.fg }),
		sym("@float")({ fg = colors.fg }),
		sym("@function")({ fg = colors.fg }),
		sym("@function.builtin")({ fg = colors.fg }),
		sym("@function.macro")({ fg = colors.fg }),
		sym("@parameter")({ fg = colors.fg }),
		sym("@method")({ fg = colors.fg }),
		sym("@field")({ fg = colors.fg }),
		sym("@property")({ fg = colors.fg }),
		sym("@constructor")({ fg = colors.fg }),
		sym("@constructor.lua")({ fg = colors.delimiter }),
		sym("@conditional")({ fg = colors.fg }),
		sym("@repeat")({ fg = colors.fg }),
		sym("@label")({ fg = colors.fg }),
		sym("@operator")({ fg = colors.fg }),
		sym("@keyword")({ fg = colors.fg }),
		sym("@exception")({ fg = colors.fg }),
		sym("@variable")({ fg = colors.fg }),
		sym("@type")({ fg = colors.fg }),
		sym("@type.definition")({ fg = colors.fg }),
		sym("@storageclass")({ fg = colors.fg }),
		sym("@structure")({ fg = colors.fg }),
		sym("@namespace")({ fg = colors.fg }),
		sym("@include")({ fg = colors.fg }),
		sym("@preproc")({ fg = colors.fg }),
		sym("@debug")({ fg = colors.fg }),
		sym("@tag")({ fg = colors.fg }),

		sym("@lsp.type.class")({ fg = colors.fg }),
		sym("@lsp.type.comment")({ fg = colors.fg, italic = false }),
		sym("@lsp.type.decorator")({ fg = colors.fg }),
		sym("@lsp.type.enum")({ fg = colors.fg }),
		sym("@lsp.type.enumMember")({ fg = colors.fg }),
		sym("@lsp.type.function")({ fg = colors.fg }),
		sym("@lsp.type.interface")({ fg = colors.fg }),
		sym("@lsp.type.keyword")({ fg = colors.fg }),
		sym("@lsp.type.macro")({ fg = colors.fg }),
		sym("@lsp.type.method")({ fg = colors.fg }),
		sym("@lsp.type.namespace")({ fg = colors.fg }),
		sym("@lsp.type.parameter")({ fg = colors.fg }),
		sym("@lsp.type.property")({ fg = colors.fg }),
		sym("@lsp.type.struct")({ fg = colors.fg }),
		sym("@lsp.type.type")({ fg = colors.fg }),
		sym("@lsp.type.typeParameter")({ fg = colors.fg }),
		sym("@lsp.type.variable")({ fg = colors.fg }),

		DiagnosticError({ fg = colors.fg }),
		DiagnosticWarn({ fg = colors.fg }),
		DiagnosticInfo({ fg = colors.fg }),
		DiagnosticHint({ fg = colors.fg }),
		DiagnosticVirtualTextError({ fg = colors.fg }),
		DiagnosticVirtualTextWarn({ fg = colors.fg }),
		DiagnosticVirtualTextInfo({ fg = colors.fg }),
		DiagnosticVirtualTextHint({ fg = colors.fg }),
		DiagnosticUnderlineError({ sp = colors.fg, underline = false }),
		DiagnosticUnderlineWarn({ sp = colors.fg, underline = false }),
		DiagnosticUnderlineInfo({ sp = colors.fg, underline = false }),
		DiagnosticUnderlineHint({ sp = colors.fg, underline = false }),

		-- Git signs
		GitSignsAdd({ fg = colors.fg }),
		GitSignsChange({ fg = colors.fg }),
		GitSignsDelete({ fg = colors.fg }),

		TelescopeSelection({ fg = colors.fg, bg = colors.selection }),
	}
end)

return theme
