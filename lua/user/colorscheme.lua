-- local colorscheme = "darkplus"
local colorscheme = "gruvbox-baby"
-- local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
