return {
  "piersolenski/wtf.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {},
  keys = {
    { mode = { "n", "v" }, "<leader>;g", ":WtfSearch google<CR>",         desc = "Search diagnostic with Google" },
    { mode = { "n", "v" }, "<leader>;s", ":WtfSearch stack_overflow<CR>", desc = "Search diagnostic with Stack Overflow" },
  },
}
