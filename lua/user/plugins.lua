local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd [[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end
  }
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used by lots of plugins
  use { "williamboman/mason.nvim" }
  use { "windwp/nvim-autopairs" }  -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }
  use { "kyazdani42/nvim-tree.lua" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "akinsho/bufferline.nvim" }
  use { "mbbill/undotree" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "ellisonleao/glow.nvim" }
  --  use {
  --    "lukas-reineke/indent-blankline.nvim",
  --    commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2"
  --  }
  --  use {
  --    "goolord/alpha-nvim",
  --    commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94"
  --  }
  use "folke/which-key.nvim"
  --  use { "ellisonleao/glow.nvim", branch = 'main' }

  -- Colorschemes
  --  use {
  --    "folke/tokyonight.nvim",
  --    commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb"
  --  }
  --  use {
  --    "lunarvim/darkplus.nvim",
  --    commit = "2584cdeefc078351a79073322eb7f14d7fbb1835"
  --  }
  use { "luisiacc/gruvbox-baby" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" }         -- The completion plugin
  use { "hrsh7th/cmp-buffer" }       -- buffer completions
  use { "hrsh7th/cmp-path" }         -- path completions
  use { "hrsh7th/cmp-cmdline" }      -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  -- snippets
  use { "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" } -- snippet engine
  use {
    "rafamadriz/friendly-snippets",
  }                                     -- a bunch of snippets to use
  use "andrejlevkovitch/vim-lua-format" -- lua formatter

  -- LSP
  use { "williamboman/mason-lspconfig.nvim" } -- mason LSP config helper
  use { "neovim/nvim-lspconfig" }             -- enable LSP
  use { "jose-elias-alvarez/null-ls.nvim" }   -- for formatters and linters
  use { "RRethy/vim-illuminate" }             -- highlights similar word under cursor
  --  use { "tamago324/nlsp-settings.nvim" }  -- TODO: needed? use with jsonls

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-telescope/telescope-dap.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "47ffd0dfc5500a7c48d1b4c2a01949f5d6a041f2" }
  use { "nvim-treesitter/nvim-treesitter-textobjects" }
  --[[ use { "nvim-orgmode/orgmode", config = function() ]]
  --[[       require("orgmode").setup{} ]]
  --[[   end ]]
  --[[ } ]]
  --[[ orgmode.setup_ts_grammar() ]]
  -- Git
  use { "lewis6991/gitsigns.nvim" }
  use { "tpope/vim-fugitive" }
  use { "TimUntersberger/neogit" }
  --  use { "mattn/emmet-vim" }

  -- Golang
  --[[ use { "fatih/vim-go" } ]]
  --[[ use { "ray-x/go.nvim" } ]]
  --[[ use { 'ray-x/guihua.lua' } ]]
  --[[ use { "cweill/gotests" } ]]
  -- DAP
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui" }
  --[[ use { "theHamsta/nvim-dap-virtual-text" } ]]

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
