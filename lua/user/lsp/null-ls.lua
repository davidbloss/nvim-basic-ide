local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then return end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml", "solidity" },
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
    }, formatting.black.with { extra_args = { "--fast", "--line-length=80" } },
    --[[ formatting.lua_format.with { ]]
    --[[   extra_args = { ]]
    --[[     "--indent-width=2", "--no-use-tab", "--spaces-inside-table-braces" ]]
    --[[   } ]]
    --[[ }, ]]
    diagnostics.shellcheck,
    diagnostics.eslint,
    -- code_actions.eslint,
    --[[ diagnostics.eslint_d, ]]
    diagnostics.golangci_lint,
    code_actions.eslint_d,
    code_actions.shellcheck,
  }
}
