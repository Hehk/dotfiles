function SetupFlexoki(background)
	local c = require("flexoki.palette").palette()
  local bg = c["bg"]
  local bg2 = c["bg-2"]
  local bg3 = c["bg-3"]

	local t = c["tx"]
	local t2 = c["tx-2"]
	local t3 = c["tx-3"]

	local red = c["re"]
	local orange = c["or"]
	local yellow = c["ye"]
	local blue = c["bl"]
	local magenta = c["ma"]
	local purple = c["pu"]

	require("flexoki").colorscheme({
		variant = background,
		highlight_groups = {
      ["CursorColumn"] = { bg = bg2 },
      ["CursorLine"] = { bg = bg2 },

			["String"] = { fg = t, bg = "None" },

			["Constant"] = { fg = t, bg = "None" },
			["Identifier"] = { fg = t, bg = "None" },
			["Keyword"] = { fg = t, bg = "None" },
			["Function"] = { fg = t, bg = "None" },
			["Type"] = { fg = t, bg = "None" },
			["Number"] = { fg = t, bg = "None" },
			["Boolean"] = { fg = t, bg = "None" },
			["Character"] = { fg = t, bg = "None" },
			["Conditional"] = { fg = t, bg = "None" },
			["Repeat"] = { fg = t, bg = "None" },
			["Label"] = { fg = t, bg = "None" },
			["Tag"] = { fg = t, bg = "None" },
      ["Structure"] = { fg = t, bg = "None" },
      ["Special"] = { fg = t, bg = "None" },

			["Comment"] = { fg = t2, bg = "None", italic = true },
			["Operator"] = { fg = t2, bg = "None" },
			["Delimiter"] = { fg = t3, bg = "None" },

			["Error"] = { fg = red, bg = "None", underline = true },
			["DiagnosticError"] = { fg = red, bg = "None" },
			["DiagnosticUnderlineError"] = { fg = t, bg = "None", underline = true },

			["DiagnosticUnnecessary"] = { fg = blue, bg = "None" },
			["DiagnosticUnderlineUnnecessary"] = { fg = t, bg = "None", underline = true },

			["@type"] = { fg = purple, bg = "None" },

			-- Typescript fixes
      ["@constructor.tsx"] = { link = "@variable" },
			["@type.builtin.typescript"] = { link = "@type" },
			["@type.tsx"] = { link = "Tag" },
      ["@type.builtin.tsx"] = { link = "@type" },
			["@lsp.type.class.typescriptreact"] = { link = "Identifier" },

      -- Lua fixed
      
		},
	})
end

local function SetColors(color, background)
	color = (color or "flexoki")
	background = (background or "light")

	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.termguicolors = true
	vim.opt.background = background
	vim.wo.signcolumn = "yes"
	vim.wo.foldcolumn = "0"
	vim.o.termguicolors = true
	if string.find(color, "flexoki") then
		SetupFlexoki(background)
	else
		vim.cmd.colorscheme(color)
	end
end

SetColors()
