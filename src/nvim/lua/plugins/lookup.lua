return {
  dir = "~/Programming/lookup.nvim/",
  name = "lookup.nvim",
  keys = {
    { mode = "n", "<leader>sg", ":Lookup google<CR>", desc = "󰊭 Google" },
    { mode = "n", "<leader>sb", ":Lookup bing<CR>", desc = "󰂤 Bing" },
    { mode = "n", "<leader>sy", ":Lookup yahoo<CR>", desc = " Yahoo" },
    { mode = "n", "<leader>sY", ":Lookup yandex<CR>", desc = "🇷🇺Yandex" },
    { mode = "n", "<leader>sd", ":Lookup duck_duck_go<CR>", desc = "󰇥 DuckDuckGo" },
    { mode = "n", "<leader>sc", ":Lookup baidu<CR>", desc = "🇨🇳Baidu" },
    { mode = "n", "<leader>so", ":Lookup stack_overflow<CR>", desc = " StackOverflow" },
    { mode = "n", "<leader>sw", ":Lookup wikipedia<CR>", desc = "󰖬 Wikipedia" },
    { mode = "n", "<leader>sR", ":Lookup reddit<CR>", desc = " Reddit" },
    { mode = "n", "<leader>sr", ":Lookup google_reddit<CR>", desc = " Google Reddit" },
  },
  config = function()
    require("lookup").setup()
  end,
}
