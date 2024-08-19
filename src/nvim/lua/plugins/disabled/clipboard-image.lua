return {
  'ekickx/clipboard-image.nvim',
  ft = { 'markdown' },
  config = function()
    require 'clipboard-image'.setup {
      default = {
        img_dir = "assets",
        img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
        affix = "<\n  %s\n>"                                           -- Multi lines affix
      },
      markdown = {
        img_dir = { "src", "assets", "img" }, -- Use table for nested dir (New feature form PR #20)
        img_dir_txt = "/assets",
      }
    }
  end
}
