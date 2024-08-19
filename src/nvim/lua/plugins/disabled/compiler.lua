return {
  "Zeioth/compiler.nvim",
  dependencies = { "stevearc/overseer.nvim" },
  opts = {},
  keys = {
    { mode = "n", "<leader>co", ":CompilerOpen<CR>",          desc = "CompilerOpen" },
    { mode = "n", "<leader>ct", ":CompilerToggleResults<CR>", desc = "CompilerToggleResults" },
    { mode = "n", "<leader>cr", ":CompilerRedo<CR>",          desc = "CompilerRedo" },
    { mode = "n", "<leader>cc", ":CompilerClose<CR>",         desc = "CompilerClose" },
  },
}
