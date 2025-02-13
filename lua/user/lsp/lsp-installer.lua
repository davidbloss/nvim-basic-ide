-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then return end

local servers = {
  "bashls",
  --[[ "eslint_d", ]]
  "eslint",
  "gopls",
  "yamlls",
  "jsonls",
  --[[ "pyright", ]]
  "ruff_lsp",
  "emmet_ls",
  "sumneko_lua",
  "tsserver",
  "jedi_language_server",
}

-- lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then return end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "jsonls" then
    local jsonls = require "user.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls, opts)
  end

  if server == "yamlls" then
    local yamlls = require "user.lsp.settings.yamlls"
    opts = vim.tbl_deep_extend("force", yamlls, opts)
  end

  -- if server == "jedi_language_server" then
  --   local jedi_opts = require "user.lsp.settings.jedi_language_server"
  --   opts = vim.tbl_deep_extend("force", jedi_opts, opts)
  -- end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "emmet_ls" then
    local emmet_ls_opts = require "user.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end

  lspconfig[server].setup(opts)
end
