return {
  "mbbill/undotree",
  keys = {
    { mode = { "n" }, "<leader>;u", ":UndotreeToggle<CR>", desc = " Undotree", silent = true },
  },
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end
}
