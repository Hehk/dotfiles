if vim.g.vscode then
	return
end

local util = require("formatter.util")
local formatter = require("formatter")
formatter.setup({
	log_level = vim.log.levels.WARN,
	filetype = {
		-- (fn formatters.fnlfmt []
		-- "The fennel formatter"
		-- {:exe :fnlfmt :args [(nvim.buf_get_name 0)] :stdin true})
		fennel = {
			function()
				return {
					exe = "fnlfmt",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},

		go = {
			require("formatter.defaults").gofmt,
		},

		typescript = {
			require("formatter.defaults").prettier,
		},
		typescriptreact = {
			require("formatter.defaults").prettier,
		},
		javascript = {
			require("formatter.defaults").prettier,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
	},
})

vim.keymap.set("n", "<leader>f", "<cmd>Format<cr>")
vim.keymap.set("n", "<leader>F", "<cmd>FormatWrite<cr>")
