return {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gg", "<cmd>Git<cr>", {})
      vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", {})
    end
  },
  {
    "airblade/vim-gitgutter",
    config = function()
      vim.keymap.set("n", "[g", "<cmd>GitGutterPrevHunk<cr>", {})
      vim.keymap.set("n", "]g", "<cmd>GitGutterNextHunk<cr>", {})
    end
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      local marks = require("marks")
      marks.setup {
        mappings = {
          next = "]m",
          prev = "[m",
        }
      }
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }
      require('telescope').load_extension('fzf')

      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")

      local function find_files()
        local dropdown = themes.get_dropdown({ previewer = false, path_display = { "truncate" } })
        return builtin.find_files(dropdown)
      end

      local function git_files()
        local opts = themes.get_dropdown({ previewer = false, path_display = { "truncate" } })
        opts.show_untracked = true
        return builtin.git_files(opts)
      end

      vim.keymap.set("n", "<C-p>", git_files, {})
      vim.keymap.set("n", "<C-S-p>", find_files, {})

      return vim.keymap.set("n", "<C-f>", function()
        return builtin.live_grep { path_display = { "truncate" } }
      end, {})
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
      vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

      vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
    end
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set('n', '<leader>tu', vim.cmd.UndotreeToggle)
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      -- I just wanted diagnostics in the statusline
      require("lualine").setup({
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { "filename", file_status = true, path = 1 } },
          lualine_x = { "diagnostics" },
          lualine_y = {},
          lualine_z = {},
        },
      })
    end
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 500,
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    'folke/trouble.nvim',
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup({
        columns = {},
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          -- ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["g."] = "actions.toggle_hidden",
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = true,
        },
      })

      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { { "biome", "prettierd", "prettier", stop_after_first = true } },
          javascriptreact = { { "biome", "prettierd", "prettier", stop_after_first = true } },
          typescript = { { "biome", "prettierd", "prettier", stop_after_first = true } },
          typescriptreact = { { "biome", "prettierd", "prettier", stop_after_first = true } },
          clojure = { "cljfmt" },
          ocaml = { 'ocamlformat' }
        },
      })

      local format_on_save = true
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          if format_on_save then
            require("conform").format({ bufnr = args.buf, lsp_fallback = true, quiet = true })
          end
        end,
      })

      vim.keymap.set("n", "tf", function()
        format_on_save = not format_on_save
        print("Format on save: " .. (format_on_save and "enabled" or "disabled"))
      end, { noremap = true, silent = false, desc = "Toggle format on save" })
      vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ bufnr = 0, lsp_fallback = true, quiet = true })
      end, { noremap = true, silent = false, desc = "Format buffer" })
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "rust", "lua" },
        compilers = { "gcc" },
        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,

          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      })

      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 3,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil,
      })
    end
  },
  { 'nvim-treesitter/nvim-treesitter-context' },

  -- Native LSP setup using Neovim 0.11+ built-in LSP
  {
    'saghen/blink.cmp',
    build = 'cargo build --release',
    lazy = false,
    priority = 900,
    opts = {
      completion = { menu = { auto_show = true } },
    },
    config = function(_, opts)
      require('blink.cmp').setup(opts)

      -- Setup diagnostic signs
      local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Setup LSP keybindings on attach
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
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

          map("[d", function()
            vim.diagnostic.jump({ count = -1 })
          end)
          map("]d", function()
            vim.diagnostic.jump({ count = 1 })
          end)
          map("[e", function()
            vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = -1 })
          end)
          map("]e", function()
            vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = 1 })
          end)
          map("[w", function()
            vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = -1 })
          end)
          map("]w", function()
            vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = 1 })
          end)

          vim.keymap.set("n", "gw", function()
            vim.diagnostic.open_float()
          end, opts)
        end
      })

      -- Configure language servers
      vim.lsp.config('biome', {
        cmd = { "npx", "biome", "lsp-proxy" },
      })
      vim.lsp.config('gopls', {})

      vim.lsp.config('eslint', {})
      local eslint_on = false
      vim.lsp.enable('eslint', eslint_on)
      local function toggle_eslint()
        eslint_on = not eslint_on
        vim.lsp.enable('eslint', eslint_on)
      end

      -- Eventually, Id like this to generalize to toggling linters in general
      vim.keymap.set('n', 'gL', toggle_eslint, { desc = 'Toggle linting' })

      vim.lsp.config('pyright', {})
      vim.lsp.config('sourcekit', {})
      vim.lsp.config('rescriptls', {})
      vim.lsp.config('ocamllsp', {
        settings = {
          codelens = { enable = true },
          inlayHints = { enable = true },
          syntaxDocumentation = { enable = true },
        },
      })
      vim.lsp.config('gleam', {})
      vim.lsp.config('clojure_lsp', {})
      vim.lsp.config('rust_analyzer', {})
      vim.lsp.config('graphql', {})

      vim.diagnostic.config({
        virtual_text = true,
      })
    end
  },

  -- Language Specific tools
  {
    "mrcjkb/haskell-tools.nvim",
    ft = { "haskell", "lhaskell", "haskell-literate", "lhaskell-literate" },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    config = function()
      require("typescript-tools").setup({})
    end
  },

  {
    "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    dir = vim.fn.stdpath("config") .. "/lua/minimal",
    name = "minimal",
    lazy = false,
    priority = 1001,
    config = function()
      -- vim.cmd("colorscheme minimal")
    end
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.set("background=light")
      vim.cmd.colorscheme('zenbones')
    end
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 999,
    opts = {},
    config = function()
      require('kanagawa').setup({
        compile = true,
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,
        dimInactive = false,
        terminalColors = true,
        colors = {
          palette = {},
          theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        theme = "wave",
      })
      -- Only use as fallback if minimal theme fails
      -- vim.cmd("colorscheme kanagawa")
    end
  }
}
