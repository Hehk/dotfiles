local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
	"rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local function map(shortcut, f)
		vim.keymap.set("n", shortcut, f, opts)
	end

	map("gd", vim.lsp.buf.definition)
	map("gt", vim.lsp.buf.type_definition)
	map("gi", vim.lsp.buf.implementation)
	map("ga", vim.lsp.buf.references)
	map("g.", vim.lsp.buf.code_action)
	map("gs", vim.lsp.buf.workspace_symbol)
	map("gh", vim.lsp.buf.signature_help)
	map("cd", vim.lsp.buf.rename)
	map("K", vim.lsp.buf.hover)

	map("[d", vim.diagnostic.goto_prev)
	map("]d", vim.diagnostic.goto_next)
	map("[e", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end)
	map("]e", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end)
	map("[w", function()
		vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARNING })
	end)
	map("]w", function()
		vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARNING })
	end)

	vim.keymap.set("n", "gw", function()
		vim.diagnostic.open_float()
	end, opts)
end)

lsp.setup()

local config = require("lspconfig")

config.biome.setup({
	cmd = { "npx", "biome", "lsp-proxy" },
})
config.pyright.setup({
	settings = {},
})
config.sourcekit.setup({})
config.rescriptls.setup({})
config.ocamllsp.setup({})
config.gleam.setup({})

vim.diagnostic.config({
	virtual_text = true,
})

-- TypeScript
local tools = require("typescript-tools")
tools.setup({})
