local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
  return
end

--=============================================================================
-------------------- debugger_python ------------------------------------------
--=============================================================================

-- dap_install.config("python", {})
-- add other configs here
-- local venv = os.getenv("CONDA_PYTHON_EXE")
-- command = vim.fn.getcwd() .. string.format("%s",venv)


-- local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = os.getenv("CONDA_PYTHON_EXE");
  -- command = 'path/to/virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";
    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      if os.getenv("CONDA_PYTHON_EXE") == 1 then
        return os.getenv("CONDA_PYTHON_EXE")
      elseif os.getenv('~/anaconda3/bin/python') == 1 then
        return '~/anaconda3/bin/python'
      else
        return '/usr/bin/python3'
      end
    end;
  },
}

-------------------------------------------------------------------------------

dap_install.setup {}

dapui.setup {
  sidebar = {
    elements = {
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      "stacks",
      "watches",
    },
    size = 40,
    position = "right", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = {
      -- {
      --     id = "repl",
      --     size = 1
      -- },
      -- {
      --     id = "console",
      --     size = 0.0
      -- },
    },
    -- size = 9,
    -- position = "bottom",
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  -- vim.cmd(":bd! \\[dap-repl]")
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  -- vim.cmd(":bd \\[dap-repl]")
  dapui.close()
end
