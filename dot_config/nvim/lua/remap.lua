local function noremap(from, to)
  return vim.api.nvim_set_keymap("n", from, to, { noremap = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = ","
noremap("<C-d>", "<C-d>zz")
noremap("<C-u>", "<C-u>zz")
noremap("n", "nzzzv")
noremap("N", "Nzzzv")

noremap("[c", "<cmd>cprev<CR>zz")
noremap("]c", "<cmd>cnext<CR>zz")

noremap("Q", "<nop>")

-- LSP restart (useful after running 'dune build' for OCaml projects)
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- Debugging keybindings
vim.keymap.set("n", "<leader>dd", function()
  -- Show diagnostic information for debugging
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)
  local lsp_clients = vim.lsp.get_clients({ bufnr = bufnr })

  print("=== Diagnostic Debug Info ===")
  print(string.format("Buffer: %d", bufnr))
  print(string.format("Diagnostics count: %d", #diagnostics))
  print(string.format("LSP clients attached: %d", #lsp_clients))

  for _, client in ipairs(lsp_clients) do
    print(string.format("  - %s (id: %d)", client.name, client.id))
  end

  if #diagnostics > 0 then
    print("\nDiagnostics found:")
    for i, diag in ipairs(diagnostics) do
      print(string.format("  %d: [%s] Line %d: %s", i, vim.diagnostic.severity[diag.severity], diag.lnum + 1, diag.message))
    end
  else
    print("\nNo diagnostics in buffer")
  end

  print("\nLSP log: " .. vim.lsp.get_log_path())
end, { desc = "Show diagnostic debug info" })

vim.keymap.set("n", "<leader>dl", function()
  vim.cmd('edit ' .. vim.lsp.get_log_path())
end, { desc = "Open LSP log" })
