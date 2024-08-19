return {
  'piersolenski/telescope-import.nvim',
  dependencies = 'nvim-telescope/telescope.nvim',
  keys = {
    { mode = "n", '<leader>f;i', ":Telescope import<CR>", desc = "Import", silent = true }
  },
  config = function()
    require("telescope").load_extension("import")
  end
}
