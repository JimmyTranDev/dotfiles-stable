return {
  "rafamadriz/friendly-snippets",
  event = "InsertEnter",
  dependencies = {
    { 'L3MON4D3/LuaSnip' },
  },
  config = function()
    local luasnip = require 'luasnip'
    luasnip.filetype_extend("javascriptreact", { "react-ts" })
  end
}
