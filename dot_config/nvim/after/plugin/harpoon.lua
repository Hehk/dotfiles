if vim.g.vscode then
    function call(action)
        return function()
            print("call VSCodeNotify(" .. action .. ")")
            vim.api.nvim_command('call VSCodeNotify("' .. action .. '")')
        end
    end

    function bind(key, action)
        vim.keymap.set('n', key, call(action))
    end

    bind('<leader>a', 'vscode-harpoon.addEditor')
    bind('<C-e>', 'vscode-harpoon.editorQuickPick')

    bind('<C-h>', 'vscode-harpoon.gotoEditor1')
    bind('<C-j>', 'vscode-harpoon.gotoEditor2')
    bind('<C-k>', 'vscode-harpoon.gotoEditor3')
    bind('<C-l>', 'vscode-harpoon.gotoEditor4')
else
  local mark = require("harpoon.mark")
  local ui = require("harpoon.ui")
  vim.keymap.set("n", "<leader>a", mark.add_file)
  vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
  vim.keymap.set('n', '<leader>hc', mark.clear_all)
  vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
  vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
  vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
  vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
end

