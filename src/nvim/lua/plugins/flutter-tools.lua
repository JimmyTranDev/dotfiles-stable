return {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = true,
  ft = { 'dart' },
  keys = {
    { mode = 'n', "<leader>tfs", ":FlutterRun<CR>",       silent = true, desc = "Flutter Run" },
    { mode = 'n', "<leader>tfe", ":FlutterEmulators<CR>", silent = true, desc = "Flutter Emulators" },
    { mode = 'n', "<leader>tfr", ":FlutterReload<CR>",    silent = true, desc = "Flutter Reload" },
    { mode = 'n', "<leader>tfR", ":FlutterRestart<CR>",   silent = true, desc = "Flutter Restart" },
  },
}
