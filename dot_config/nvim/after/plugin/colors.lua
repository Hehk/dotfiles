-- [nfnl] Compiled from after/plugin/colors.fnl by https://github.com/Olical/nfnl, do not edit.
local function SetColors(color, background)
  local color0 = (color or "zenbones")
  local background0 = (background or "light")
  vim.opt.cursorline = true
  vim.opt.cursorcolumn = true
  vim.opt.numberwidth = 2
  vim.opt.termguicolors = true
  vim.opt.background = background0
  vim.wo.signcolumn = "no"
  vim.wo.foldcolumn = "0"
  vim.cmd.colorscheme(color0)
  if (color0 == "two-firewatch") then
    return vim.api.nvim_set_hl(0, "SignColumn", {bg = "background"})
  else
    return nil
  end
end
return SetColors()
