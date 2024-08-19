return {
  'ruifm/gitlinker.nvim',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = {
    {
      mode = { 'n', 'v' },
      'gy',
      function()
        require("gitlinker").get_buf_range_url("n",
          { action_callback = require("gitlinker.actions").open_in_browser })
      end,
      silent = true,
      desc = "Open Git Link",
    }
  },
  config = function()
    require('gitlinker').setup({
      mappings = false,
    })
  end
}
