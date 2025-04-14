-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
function Transparent(color)
  color = color or "catppuccin"
  vim.cmd.colorscheme(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeoTreeNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "none" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end
Transparent()
