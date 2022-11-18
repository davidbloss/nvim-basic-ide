local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

--[[ dap.adapters.go =  ]]

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

--dap_install.setup {}

--dap_install.config("python", {})
-- add other configs here
local debugpy_path = vim.fn.stdpath "data" .. "/mason/bin"

dap.adapters.python = {
  type = "executable",
  command = debugpy_path,
  args = { '-m', 'debugpy.adapter' }
}
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
    pythonPath = function()
      local venv_path = os.getenv("VIRTUAL_ENV")
      if venv_path then
            return venv_path .. "/bin/python"
        end
      if vim.fn.executable(debugpy_path) == 1 then
            return debugpy_path
        else
          return "python"
        end
    end,
  }
}

dapui.setup {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
      },
      size = 40,
      position = "right", -- Can be "left", "right", "top", "bottom"
    },
    {
      elements = {},
      size = 10,
      position = "right", -- Can be "left", "right", "top", "bottom"
    },
  }
}

--[[ dapui.setup { ]]
--[[   sidebar = { ]]
--[[     elements = { ]]
--[[       { ]]
--[[         id = "scopes", ]]
--[[         size = 0.25, -- Can be float or integer > 1 ]]
--[[       }, ]]
--[[       { id = "breakpoints", size = 0.25 }, ]]
--[[     }, ]]
--[[     size = 40, ]]
--[[     position = "right", -- Can be "left", "right", "top", "bottom" ]]
--[[   }, ]]
--[[   tray = { ]]
--[[     elements = {}, ]]
--[[   }, ]]
--[[ } ]]

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
