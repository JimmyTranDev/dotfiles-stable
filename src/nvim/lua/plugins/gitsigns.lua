return {
  'lewis6991/gitsigns.nvim',
  event = "BufRead",
  keys = {
    { mode = "n", '<leader>js', function() require('gitsigns').stage_hunk() end,                                      desc = "Stage Hunk" },
    { mode = "n", '<leader>jr', function() require('gitsigns').reset_hunk() end,                                      desc = "Reset Hunk" },
    { mode = "v", '<leader>js', function() require('gitsigns').stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, desc = "Stage Hunk" },
    { mode = "v", '<leader>jr', function() require('gitsigns').reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, desc = "Reset Hunk" },
    { mode = "n", '<leader>jS', function() require('gitsigns').stage_buffer() end,                                    desc = "Stage Buffer" },
    { mode = "n", '<leader>ju', function() require('gitsigns').undo_stage_hunk() end,                                 desc = "Undo Stage Hunk" },
    { mode = "n", '<leader>jR', function() require('gitsigns').reset_buffer() end,                                    desc = "Reset Buffer" },
    { mode = "n", '<leader>jp', function() require('gitsigns').preview_hunk() end,                                    desc = "Preview Hunk" },
    { mode = "n", '<leader>jb', function() require('gitsigns').blame_line { full = true } end,                        desc = "Blame Line" },
    { mode = "n", '<leader>jb', function() require('gitsigns').toggle_current_line_blame() end,                       desc = "Toggle Current Line Blame" },
    { mode = "n", '<leader>jd', function() require('gitsigns').diffthis() end,                                        desc = "Diff This" },
    { mode = "n", '<leader>jD', function() require('gitsigns').diffthis('~') end,                                     desc = "Diff This" },
    { mode = "n", '<leader>jd', function() require('gitsigns').toggle_deleted() end,                                  desc = "Toggle Deleted" },
    { mode = "o", 'x',          'ih',                                                                                 ':<C-U>Gitsigns select_hunk<CR>' },
  },
  config = function()
    require('gitsigns').setup {
      signs                   = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signcolumn              = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl                   = true,  -- Toggle with `:Gitsigns toggle_numhl`
      linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir            = {
        follow_files = true
      },
      attach_to_untracked     = true,
      current_line_blame      = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      update_debounce         = 100,
      -- fweafe
      status_formatter        = nil,   -- Use default
      max_file_length         = 40000, -- Disable if file is longer than this (in lines)
      preview_config          = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach               = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })
      end
    }
  end
}
