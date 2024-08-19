return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
  end,
  -- Because of tabout
  keys = function()
    -- Disable default tab keybinding in LuaSnip
    return {}
  end,
}
