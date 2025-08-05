local M = {}

local function setup()
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end

  vim.g.colors_name = 'minimal'
  vim.o.termguicolors = true

  local palette = {
    dark = {
      bg = "#1a1a1a",
      fg = "#d4d4d4",
      gray = "#808080",
      lightgray = "#a0a0a0",
      darkgray = "#505050",
      black = "#000000",
      white = "#ffffff",

      blue = "#6699cc",
      green = "#99cc99",
      red = "#cc6666",
      yellow = "#cccc99",
      purple = "#cc99cc",
      cyan = "#66cccc",
      orange = "#cc9966",

      selection = "#3a3d41",
      comment = "#6a9955",
      line_number = "#858585",
      cursor_line = "#2c2c2c",

      error = "#cc6666",   -- same as red
      warning = "#cccc99", -- same as yellow
      info = "#6699cc",    -- same as blue
      hint = "#66cccc",    -- same as cyan
    },

    light = {
      bg = "#f5f5f5",
      fg = "#333333",
      gray = "#777777",
      lightgray = "#999999",
      darkgray = "#555555",
      black = "#000000",
      white = "#ffffff",

      blue = "#4477aa",
      green = "#669966",
      red = "#aa5555",
      yellow = "#aaaa77",
      purple = "#aa77aa",
      cyan = "#55aaaa",
      orange = "#aa7755",

      selection = "#d0d0d0",
      comment = "#559955",
      line_number = "#aaaaaa",
      cursor_line = "#e5e5e5",

      error = "#aa5555",   -- same as red
      warning = "#aaaa77", -- same as yellow
      info = "#4477aa",    -- same as blue
      hint = "#55aaaa",    -- same as cyan
    }
  }

  local function get_palette()
    local background = vim.o.background or "dark"
    return palette[background]
  end

  local p = get_palette()

  -- Define highlight groups
  local highlights = {
    -- UI elements
    Normal = { fg = p.fg, bg = p.bg },
    NormalFloat = { fg = p.fg, bg = p.bg },
    NormalNC = { fg = p.fg, bg = p.bg },
    Cursor = { fg = p.bg, bg = p.fg },
    CursorLine = { bg = p.cursor_line },
    CursorLineNr = { fg = p.line_number or p.lightgray, bold = true },
    LineNr = { fg = p.line_number or p.darkgray },
    SignColumn = { bg = p.bg },
    ColorColumn = { bg = p.darkgray },

    -- Borders and separators
    VertSplit = { fg = p.darkgray, bg = p.bg },
    StatusLine = { fg = p.lightgray, bg = p.darkgray },
    StatusLineNC = { fg = p.gray, bg = p.darkgray },

    -- Selection
    Visual = { bg = p.selection },
    Search = { bg = p.selection, fg = p.white },
    IncSearch = { bg = p.orange, fg = p.white },

    -- Messages
    Error = { fg = p.error or p.red },
    ErrorMsg = { fg = p.error or p.red },
    WarningMsg = { fg = p.warning or p.yellow },
    MoreMsg = { fg = p.green },
    Question = { fg = p.cyan },

    -- Syntax
    Comment = { fg = p.comment or p.gray, italic = true },
    Constant = { fg = p.purple },
    String = { fg = p.green },
    Character = { fg = p.green },
    Number = { fg = p.orange },
    Boolean = { fg = p.orange },
    Float = { fg = p.orange },

    Identifier = { fg = p.fg },
    Function = { fg = p.blue },

    Statement = { fg = p.purple },
    Conditional = { fg = p.purple },
    Repeat = { fg = p.purple },
    Label = { fg = p.purple },
    Operator = { fg = p.cyan },
    Keyword = { fg = p.purple },
    Exception = { fg = p.red },

    PreProc = { fg = p.cyan },
    Include = { fg = p.cyan },
    Define = { fg = p.cyan },
    Macro = { fg = p.cyan },
    PreCondit = { fg = p.cyan },

    Type = { fg = p.yellow },
    StorageClass = { fg = p.yellow },
    Structure = { fg = p.yellow },
    Typedef = { fg = p.yellow },

    Special = { fg = p.orange },
    SpecialChar = { fg = p.orange },
    Tag = { fg = p.blue },
    Delimiter = { fg = p.fg },
    SpecialComment = { fg = p.comment or p.gray, italic = true },
    Debug = { fg = p.red },

    Underlined = { underline = true },
    Ignore = { fg = p.gray },
    Todo = { fg = p.yellow, bg = p.darkgray, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = p.error or p.red },
    DiagnosticWarn = { fg = p.warning or p.yellow },
    DiagnosticInfo = { fg = p.info or p.blue },
    DiagnosticHint = { fg = p.hint or p.cyan },

    -- Treesitter
    ["@keyword"] = { link = "Keyword" },
    ["@string"] = { link = "String" },
    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },
    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { fg = p.purple },
    ["@field"] = { fg = p.fg },
    ["@property"] = { fg = p.fg },
    ["@constructor"] = { fg = p.yellow },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = p.yellow, italic = true },
    ["@tag"] = { link = "Tag" },
    ["@tag.attribute"] = { fg = p.green },
    ["@comment"] = { link = "Comment" },

    -- Git
    DiffAdd = { fg = p.green, bg = p.darkgray },
    DiffChange = { fg = p.yellow, bg = p.darkgray },
    DiffDelete = { fg = p.red, bg = p.darkgray },
    DiffText = { fg = p.fg, bg = p.darkgray },

    -- Completion menu
    Pmenu = { fg = p.fg, bg = p.darkgray },
    PmenuSel = { fg = p.fg, bg = p.gray },
    PmenuSbar = { bg = p.darkgray },
    PmenuThumb = { bg = p.gray },
  }

  -- Apply highlights
  for group, styles in pairs(highlights) do
    if styles.link then
      vim.cmd(string.format("highlight! link %s %s", group, styles.link))
    else
      local style_str = {}
      for k, v in pairs(styles) do
        if k == "fg" or k == "bg" then
          table.insert(style_str, string.format("%s=%s", k, v))
        elseif v == true then
          table.insert(style_str, k)
        end
      end
      vim.cmd(string.format("highlight %s %s", group, table.concat(style_str, " ")))
    end
  end
end

M.setup = setup
return M