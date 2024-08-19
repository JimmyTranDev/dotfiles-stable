return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofmt" },
        rust = { "rustfmt" },
        dart = { "dartfmt" },
        haskell = { "ormolu" },
        java = { "google-java-format" },

        -- NOTE: disabled because eslint lsp already formats on save
        -- javascript = { "eslint_d" },
        -- javascriptreact = { "eslint_d" },
        -- typescript = { "eslint_d" },
        -- typescriptreact = { "eslint_d" },

        json = { "prettierd" },
        jsonc = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd" },
        markdown = { "prettierd" },
        xhtml = { "prettierd" },
        xml = { "prettierd" },
        yaml = { "prettierd" },

        nix = { "alejandra" },
        bash = { "shfmt" },
        sh = { "shfmt" },
      },
    })
  end,
}
