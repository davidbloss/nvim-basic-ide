require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.illuminate"
-- require "user.indentline"
-- require "user.alpha"
require "user.whichkey"
require "user.mason" -- Before LSP
require "user.lsp" -- After Mason
require "user.dap"


--[[ require("orgmode").setup_ts_grammar() ]]
require("go").setup()
require("glow").setup({
  width = 100,
})
