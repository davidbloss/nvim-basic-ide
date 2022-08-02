-- Autocommand that reloads neovim whenever you save the plugins.lua file

-- Auto format on save
vim.cmd [[
  augroup format_on_save
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup end
]]
