local constants = require("core.constants")

return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "cat " .. constants.NEOVIM_DIR .. "OPENAI_API_KEY.txt"
    })

    vim.keymap.set(
      'n',
      '<leader>cgc',
      ':ChatGPT<CR>',
      { desc = "ChatGPT", silent = true }
    )
    vim.keymap.set(
      'n',
      '<leader>cga',
      ':ChatGPTActAs<CR>',
      { desc = "Act As", silent = true }
    )

    vim.keymap.set(
      'v',
      '<leader>cge',
      ':ChatGPTEditWithInstruction<CR>',
      { desc = "Edit with instruction", silent = true }
    )
    vim.keymap.set(
      'v',
      '<leader>cgg',
      ':ChatGPTRun grammar_correction<CR>',
      { desc = "Grammar Correction", silent = true }
    )
    vim.keymap.set(
      'v',
      '<leader>cgt',
      ':ChatGPTRun translate<CR>',
      { desc = "Translate", silent = true }
    )
    vim.keymap.set(
      'v',
      '<leader>cgk',
      ':ChatGPTRun keywords<CR>',
      { desc = "Keywords", silent = true }
    )
    vim.keymap.set(
      'v',
      '<leader>cgd',
      ':ChatGPTRun docstring<CR>',
      { desc = "Docstring", silent = true }
    )
    vim.keymap.set(
      'v',
      '<leader>cga',
      ':ChatGPTRun add_tests<CR>',
      { desc = "Add Tests", silent = true }
    )
    vim.keymap.set(
      'v', '<leader>cgo',
      ':ChatGPTRun optimize_code<CR>',
      { desc = "Optimize Code", silent = true }
    )
    vim.keymap.set(
      'v', '<leader>cgs',
      ':ChatGPTRun summarize<CR>',
      { desc = "Summarize", silent = true }
    )
    vim.keymap.set(
      'v', '<leader>cgf',
      ':ChatGPTRun fix_bugs<CR>',
      { desc = "Fix Bugs", silent = true }
    )
    vim.keymap.set(
      'v', '<leader>cgx',
      ':ChatGPTRun explain_code<CR>',
      { desc = "Explain Code", silent = true }
    )
    vim.keymap.set(
      'v', '<leader>cgr',
      ':ChatGPTRun roxygen_edit<CR>',
      { desc = "Roxygen Edit", silent = true }
    )
    vim.keymap.set(
      'v', '<leader>cgl',
      ':ChatGPTRun code_readability_analysis<CR>',
      { desc = "Code Readability Analysis", silent = true }
    )
  end,
}
