return {
  'sQVe/sort.nvim',
  keys = {
    { mode = "v", "<Leader>S", ":Sort<cr>", desc = "󰖽 Sort", silent = true },
  },

  -- Optional setup for overriding defaults.
  config = function()
    require("sort").setup({
      -- Input configuration here.
      -- Refer to the configuration section below for options.
    })
  end
}
