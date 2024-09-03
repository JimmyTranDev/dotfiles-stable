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

    { mode = "v", "<leader>sg", ":LookupSelected google<CR>", desc = "󰊭 Google" },
    { mode = "v", "<leader>sb", ":LookupSelected bing<CR>", desc = "󰂤 Bing" },
    { mode = "v", "<leader>sy", ":LookupSelected yahoo<CR>", desc = " Yahoo" },
    { mode = "v", "<leader>sY", ":LookupSelected yandex<CR>", desc = "🇷🇺Yandex" },
    { mode = "v", "<leader>sd", ":LookupSelected duck_duck_go<CR>", desc = "󰇥 DuckDuckGo" },
    { mode = "v", "<leader>sc", ":LookupSelected baidu<CR>", desc = "🇨🇳Baidu" },
    { mode = "v", "<leader>so", ":LookupSelected stack_overflow<CR>", desc = " StackOverflow" },
    { mode = "v", "<leader>sw", ":LookupSelected wikipedia<CR>", desc = "󰖬 Wikipedia" },
    { mode = "v", "<leader>sR", ":LookupSelected reddit<CR>", desc = " Reddit" },
    { mode = "v", "<leader>sr", ":LookupSelected google_reddit<CR>", desc = " Google Reddit" },
  },
  config = function()
    require("lookup").setup()
  end,
}
