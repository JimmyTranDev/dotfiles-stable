return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/neodev.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "mfussenegger/nvim-dap",
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup()
    local lspActions = require("custom.lsp.actions")
    require("mason-nvim-dap").setup({
      ensure_installed = {
        "stylua",
      },
      automatic_installation = true,
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "bashls",
        "clangd",
        "cssls",
        "eslint",
        "gopls",
        "html",
        "jsonls",
        "lemminx",
        "marksman",
        "pyright",
        "rust_analyzer",
        "tsserver",
        -- "nil_ls",
      },
    })

    local lspConfig = require("lspconfig")

    -- Set up lspconfig.
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    local lsp_servers = {
      "bashls",
      "clangd",
      "cssls",
      "html",
      "jsonls",
      "lemminx",
      "marksman",
      "pyright",
      "rust_analyzer",
      "tsserver",
      -- "nil_ls",
    }
    for _, lsp in ipairs(lsp_servers) do
      lspConfig[lsp].setup({
        capabilities = capabilities,
      })
    end

    lspConfig["gopls"].setup({
      capabilities = capabilities,
      settings = {
        completions = {
          completeFunctionCalls = true,
        },
      },
    })

    lspConfig["tsserver"].setup({
      capabilities = capabilities,
      commands = {
        RenameFile = {
          lspActions.renameFile,
          description = "Rename File",
        },
      },
      init_options = {
        preferences = {
          -- other preferences...
          importModuleSpecifierPreference = "relative",
          importModuleSpecifierEnding = "minimal",
        },
      },
    })

    lspConfig["eslint"].setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    lspConfig["lua_ls"].setup({
      capabilities = capabilities,
      cmd = { "lua-language-server" },
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}
