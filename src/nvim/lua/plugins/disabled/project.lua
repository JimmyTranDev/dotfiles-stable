return {
  "ahmedkhalf/project.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    { mode = "n", "<leader>fp", "<cmd>Telescope projects<cr>", silent = true, desc = "Projects" }
  },
  config = function()
    require("project_nvim").setup {}
    require('telescope').load_extension('projects')
  end
}
