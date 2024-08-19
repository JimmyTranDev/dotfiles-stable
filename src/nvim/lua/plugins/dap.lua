return {
  "mfussenegger/nvim-dap",
  keys = {
    { mode = "n", "<leader>yr", ":lua require'dap'.restart()<CR>",           silent = true, desc = "DAP Restart" },
    { mode = "n", "<leader>yc", ":lua require'dap'.continue()<CR>",          silent = true, desc = "DAP Continue" },
    { mode = "n", "<leader>yo", ":lua require'dap'.step_over()<CR>",         silent = true, desc = "DAP Step Over" },
    { mode = "n", "<leader>yI", ":lua require'dap'.step_into()<CR>",         silent = true, desc = "DAP Step Into" },
    { mode = "n", "<leader>yO", ":lua require'dap'.step_out()<CR>",          silent = true, desc = "DAP Step Out" },
    { mode = "n", "<leader>yb", ":lua require'dap'.toggle_breakpoint()<CR>", silent = true, desc = "DAP Toggle Breakpoint" },
    { mode = "n", "<leader>ys", ":lua require'dap'.repl.open()<CR>",         silent = true, desc = "DAP Open Repl" },
    { mode = "n", "<leader>yl", ":DapShowLog<CR>",                           silent = true, desc = "DAP Show Log" },
  },
  config = function()
  end
}
