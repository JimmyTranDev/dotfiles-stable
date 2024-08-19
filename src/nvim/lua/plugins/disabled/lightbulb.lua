return {
  'kosayoda/nvim-lightbulb',
  event = "BufRead",
  config = function()
    require("nvim-lightbulb").setup({
      autocmd = { enabled = true }
    })
  end
}
