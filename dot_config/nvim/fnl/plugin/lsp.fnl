; if vim.g.vscode then
; 	return
; end

; local lsp = require("lsp-zero")
; lsp.preset("recommended")
; lsp.ensure_installed({
; 	"tsserver",
; 	"rust_analyzer",
; })

; -- Fix Undefined global 'vim'
; lsp.nvim_workspace()

; local cmp = require("cmp")
; local cmp_select = { behavior = cmp.SelectBehavior.Select }
; local cmp_mappings = lsp.defaults.cmp_mappings({
; 	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
; 	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
; 	["<C-y>"] = cmp.mapping.confirm({ select = true }),
; 	["<C-Space>"] = cmp.mapping.complete(),
; })
; cmp_mappings["<Tab>"] = nil
; cmp_mappings["<S-Tab>"] = nil

; lsp.setup_nvim_cmp({
; 	mapping = cmp_mappings,
; })

; lsp.set_preferences({
; 	suggest_lsp_servers = true,
; 	sign_icons = {
; 		error = "E",
; 		warn = "W",
; 		hint = "H",
; 		info = "I",
; 	},
; })

; lsp.on_attach(function(client, bufnr)
; 	local opts = { buffer = bufnr, remap = false }

; 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
; 	vim.keymap.set("n", "K", function()
; 		vim.lsp.buf.hover()
; 	end, opts)
; 	vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, opts)
; 	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

; 	vim.keymap.set("n", "gs", vim.lsp.buf.workspace_symbol, opts)
; 	vim.keymap.set("n", "gw", function()
; 		vim.diagnostic.open_float()
; 	end, opts)
; 	vim.keymap.set("n", "[d", function()
; 		vim.diagnostic.goto_next()
; 	end, opts)
; 	vim.keymap.set("n", "]d", function()
; 		vim.diagnostic.goto_prev()
; 	end, opts)
; 	vim.keymap.set("n", "ga", function()
; 		vim.lsp.buf.code_action()
; 	end, opts)
; 	vim.keymap.set("n", "<leader>rn", function()
; 		vim.lsp.buf.rename()
; 	end, opts)
; end)

; lsp.setup()

; require("lspconfig").tailwindcss.setup({
; 	settings = {
; 		tailwindCSS = {
; 			experimental = {
; 				classRegex = {
; 					{ "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
; 				},
; 			},
; 		},
; 	},
; })

; require("lspconfig").pyright.setup({
; 	settings = {
; 	},
; })

; vim.diagnostic.config({
; 	virtual_text = true,
; })
