local telescopeActions = require('custom.telescope.actions')
local urlActions = require('custom.url.actions')

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require("telescope").setup {
      defaults = {
        file_ignore_patterns = {
          'node%_modules/',
          '%.git/',
          '%.venv/',
          'venv/',
          'dist/',
          'target/',
          'coverage/',
          "dart%_tool/",
          "android/",
          "assets/",
          "build/",
          "ios/",
          "linux/",
          "macos/",
          "web/",
          "windows/",
        },
      },
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return { "--hidden", '--no-ignore' }
          end
        },
      },
    }
  end,
  keys = {
    -- LSP

    { mode = { "n", "v" }, "ga", vim.lsp.buf.code_action, desc = "LSP Code Action" },
    { mode = { "n", "v" }, "ge", vim.diagnostic.open_float, desc = "LSP Diagnostic" },
    { mode = { "n", "v" }, "gh", vim.lsp.buf.hover, desc = "LSP Hover" },
    { mode = { "n", "v" }, "gf", vim.lsp.buf.format, desc = "LSP Format" },
    { mode = { "n", "v" }, "gu", function() require('telescope.builtin').lsp_references() end, desc = "LSP References" },
    { mode = { "n", "v" }, "gs", function() require('telescope.builtin').lsp_document_symbols() end, desc = "LSP Document Symbols" },
    { mode = { "n", "v" }, "gi", function() require('telescope.builtin').lsp_implementations() end, desc = "LSP Implementation" },
    { mode = { "n", "v" }, "gw", function() require('telescope.builtin').lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { mode = { "n", "v" }, "gW", function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end, desc = "LSP Dynamic Workspace Symbols" },
    { mode = { "n", "v" }, "gd", function() require('telescope.builtin').lsp_definitions() end, desc = "LSP Definition" },
    { mode = { "n", "v" }, "gt", function() require('telescope.builtin').lsp_type_definitions() end, desc = "LSP Type Definition" },
    { mode = { "n", "v" }, "gx", urlActions.openLink, desc = "OpenLink" },

    -- Special
    -- hidden files find files
    -- { mode = "n", "<leader>ff", function() require('telescope.builtin').find_files({ hidden = true, no_ignore=true }) end, desc="Find Files" },
    { mode = "n", "<leader>fr", function() require('telescope.builtin').resume() end, desc = "Resume" },
    -- { mode = "n", "<leader>fe", function() require('telescope.builtin').diagnostics() end, desc = "Diagnostics Files" },

    -- Grep
    { mode = "n", "<leader>fm", telescopeActions.grepMarkDownHeadingsInCurrentFile, desc = "Grep Markdown Headings" },
    { mode = "n", "<leader>fw", function() require('telescope.builtin').grep_string() end, desc = "Grep Word" },
    { mode = "n", "<leader>fW", function() require('telescope.builtin').grep_string({ search_dirs = { vim.fn.expand("%:p") } }) end, desc = "Grep Word File" },
    { mode = "v", "<leader>fg", telescopeActions.findSelectedText, desc = "Grep Selected Text" },
    { mode = "n", "<leader>fg", function() require('telescope.builtin').live_grep() end, desc = "Grep" },
    { mode = "n", "<leader>fG", function() require('telescope.builtin').live_grep({ search_dirs = { vim.fn.expand("%:p") } }) end, desc = "Grep File" },
    { mode = "n", "<leader>fd", function() require('telescope.builtin').live_grep({ search_dirs = { vim.fn.expand("%:p:h") } }) end, desc = "Grep Dir" },
    -- search node modules in root
    { mode = "n", "<leader>fn", function() require('telescope.builtin').live_grep({ search_dirs = { vim.fn.getcwd() .. '/node_modules' } }) end, desc = "Grep Node Modules" },

    -- Buffers
    { mode = "n", "<leader>fbb", function() require('telescope.builtin').buffers() end, desc = " Buffers" },
    { mode = "n", "<leader>fbf", function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = "Current Buffer Fuzzy Find" },
    { mode = "n", "<leader>fbt", function() require('telescope.builtin').current_buffer_tags() end, desc = "Current Buffer Tags" },

    -- Lists
    { mode = "n", "<leader>fll", function() require('telescope.builtin').loclist() end, desc = "Loclist" },
    { mode = "n", "<leader>flj", function() require('telescope.builtin').jumplist() end, desc = "Jumplist" },
    { mode = "n", "<leader>flq", function() require('telescope.builtin').quickfix() end, desc = "Quickfix" },

    -- History
    { mode = "n", "<leader>fhc", function() require('telescope.builtin').command_histr() end, desc = "Command" },
    { mode = "n", "<leader>fhs", function() require('telescope.builtin').search_history() end, desc = "Search" },
    { mode = "n", "<leader>fhq", function() require('telescope.builtin').quickfixhistory() end, desc = "Quickfix" },

    -- Vim
    { mode = "n", "<leader>fvo", function() require('telescope.builtin').oldfiles() end, desc = "Old Files" },
    { mode = "n", "<leader>fvc", function() require('telescope.builtin').commands() end, desc = "Commands" },
    { mode = "n", "<leader>fvt", function() require('telescope.builtin').tags() end, desc = "Tags" },
    { mode = "n", "<leader>fvh", function() require('telescope.builtin').help_tags() end, desc = "Help Tags" },
    { mode = "n", "<leader>fvM", function() require('telescope.builtin').man_pages() end, desc = "Man Pages" },
    { mode = "n", "<leader>fvm", function() require('telescope.builtin').marks() end, desc = "Marks" },
    { mode = "n", "<leader>fvC", function() require('telescope.builtin').colorscheme() end, desc = "Colorscheme" },
    { mode = "n", "<leader>fvv", function() require('telescope.builtin').vim_options() end, desc = "Vim Options" },
    { mode = "n", "<leader>fvr", function() require('telescope.builtin').registers() end, desc = "Registers" },
    { mode = "n", "<leader>fva", function() require('telescope.builtin').autocommands() end, desc = "Autocommands" },
    { mode = "n", "<leader>fvs", function() require('telescope.builtin').spell_suggest() end, desc = "Spell Suggest" },
    { mode = "n", "<leader>fvk", function() require('telescope.builtin').keymaps() end, desc = "Keymaps" },
    { mode = "n", "<leader>fvf", function() require('telescope.builtin').filetypes() end, desc = "Filetypes" },
    { mode = "n", "<leader>fvH", function() require('telescope.builtin').highlights() end, desc = "Highlights" },
    { mode = "n", "<leader>fvp", function() require('telescope.builtin').pickers() end, desc = "Pickers" },

    -- Git
    { mode = "n", "<leader>fjf", function() require('telescope.builtin').git_files() end, desc = "Files" },
    { mode = "n", "<leader>fjb", function() require('telescope.builtin').git_branches() end, desc = "Branches" },
    { mode = "n", "<leader>fjB", telescopeActions.findGitConflicts, desc = "Conflicts" },
    { mode = "n", "<leader>fjc", function() require('telescope.builtin').git_commits() end, desc = "Commits" },
    { mode = "n", "<leader>fjC", function() require('telescope.builtin').git_bcommits() end, desc = "Buffer Commits" },
    { mode = "v", "<leader>fjC", function() require('telescope.builtin').git_bcommits_range() end, desc = "Buffer Commits Range" },
    { mode = "n", "<leader>fjs", function() require('telescope.builtin').git_status() end, desc = "Status" },
    { mode = "n", "<leader>fjS", function() require('telescope.builtin').git_stash() end, desc = "Stash" },
  }
}
