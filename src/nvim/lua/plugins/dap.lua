return {
  "mfussenegger/nvim-dap",
  keys = {
    { mode = "n", "<leader>dr", ":lua require'dap'.restart()<CR>",           silent = true, desc = "DAP Restart" },
    { mode = "n", "<leader>dc", ":lua require'dap'.continue()<CR>",          silent = true, desc = "DAP Continue" },
    { mode = "n", "<leader>do", ":lua require'dap'.step_over()<CR>",         silent = true, desc = "DAP Step Over" },
    { mode = "n", "<leader>dI", ":lua require'dap'.step_into()<CR>",         silent = true, desc = "DAP Step Into" },
    { mode = "n", "<leader>dO", ":lua require'dap'.step_out()<CR>",          silent = true, desc = "DAP Step Out" },
    { mode = "n", "<leader>dd", ":lua require'dap'.toggle_breakpoint()<CR>", silent = true, desc = "DAP Toggle Breakpoint" },
    { mode = "n", "<leader>ds", ":lua require'dap'.repl.open()<CR>",         silent = true, desc = "DAP Open Repl" },
    { mode = "n", "<leader>dl", ":DapShowLog<CR>",                           silent = true, desc = "DAP Show Log" },
  },
  config = function()
    local dap = require("dap")
    -- Lua
    dap.adapters["local-lua"] = {
      type = "executable",
      command = "node",
      args = {
        "$HOME/local-lua-debugger-vscode/extension/debugAdapter.js"
      },
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          -- 💀 If this is missing or wrong you'll see
          -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
          c.extensionPath = "$HOME/local-lua-debugger-vscode/extension"
          on_config(c)
        else
          on_config(config)
        end
      end,
    }

    -- Flutter/Dart
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        dartSdkPath = "/opt/homebrew/bin/dart",       -- ensure this is correct
        flutterSdkPath = "/opt/homebrew/bin/flutter", -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
        cwd = "${workspaceFolder}",
      },
      {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = "/opt/homebrew/bin/dart",       -- ensure this is correct
        flutterSdkPath = "/opt/homebrew/bin/flutter", -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
        cwd = "${workspaceFolder}",
      }
    }
  end
}
