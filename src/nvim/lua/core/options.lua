vim.opt.spelllang = "en_us"

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- copilot
vim.g.copilot_no_tab_map = true

-- line numbers
vim.wo.relativenumber = true
vim.wo.number = true

-- auto center screen
vim.o.scrolloff = 99999

-- spacing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- netrw
vim.g.netrw_sort_sequence = 'r'

-- disable wrap
vim.wo.wrap = false
vim.wo.linebreak = true
vim.wo.list = false

-- make status bar always bottom
vim.o.laststatus = 3

-- ts context comment string
vim.opt.updatetime = 100

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
-- vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "󰌵", texthl = "DiagnosticSignHint" })

-- Line
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#5e67a1', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#5e67a1', bold = true })
