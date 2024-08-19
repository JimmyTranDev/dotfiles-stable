return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufRead",
  config = function()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        modules = {},
        ensure_installed = {
          "lua",
        },
        ignore_install = {},
        sync_install = false,
        auto_install = true,
        highlight = {
          enabled = true
        },
        additional_vim_regex_highlighting = true,
      }
    end, 0)
  end
}
