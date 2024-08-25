local keymap = vim.keymap

local constants = require("core.constants")
local fileActions = require("custom.files.actions")
local lookupActions = require("custom.lookup.actions")
local loggingActions = require("custom.logging.actions")

local TechnicalLinkType = require("custom.lookup.constants").technicalLinkField
local openTechnicalLink = lookupActions.openTechnicalLink
local openTechnicalLinkCurrent = lookupActions.openTechnicalLinkCurrent

local alphabet = "abcdefghijklmnopqrstuvwxyz"
for i = 1, #alphabet do
  local letter = alphabet:sub(i, i)
  local upLetter = letter:upper()

  keymap.set('n', 'm' .. letter, 'm' .. upLetter, { desc = "Save mark " .. letter, silent = true })
  keymap.set('n', "'" .. letter, '`' .. upLetter, { desc = "Goto mark " .. letter, silent = true })
end

-- Misc
keymap.set('n', '<Leader>;S', ':!rm -r ' .. constants.NEOVIM_STATE_DIR .. '<CR>',
  { desc = "󰾴 Clear Nvim Swaps", silent = true })
keymap.set('n', '<Leader>;c', function() vim.cmd("set spell!") end, { desc = " Toggle Spell Checker", silent = true })
keymap.set('n', '<Leader>;q', ':rightbelow copen<CR>', { desc = "󰁨 Toggle Quickfix", silent = true })
keymap.set('n', '<Leader>;Q', ':cclose<CR>', { desc = "󰁨 Close Quickfix", silent = true })
keymap.set('n', '<Leader>;t', loggingActions.logWithInput("md_tasks", "[misc] ", " Task"),
  { desc = " Log Task", silent = true })
keymap.set('n', '<Leader>;n', loggingActions.logWithInput("md_notes", "", "󰎚 Note"),
  { desc = "󰎚 Log Note", silent = true })

local actionToTechnicalLinkType = {
  ["󰊤 Github"] = { type = TechnicalLinkType.REPO, map = "g" },
  [" Test Logs"] = { type = TechnicalLinkType.TEST_LOGS, map = "l" },
  [" Prod Logs"] = { type = TechnicalLinkType.PROD_LOGS, map = "L" },
  [" Test Pods"] = { type = TechnicalLinkType.TEST_PODS, map = "p" },
  [" Prod Pods"] = { type = TechnicalLinkType.PROD_PODS, map = "P" },
  ["  Container Registry"] = { type = TechnicalLinkType.CONTAINER_REGISTRY, map = "c" },
  ["󰒋 Local Server"] = { type = TechnicalLinkType.LOCAL_SERVER, map = "sl" },
  ["󰒋 Test Server"] = { type = TechnicalLinkType.TEST_SERVER, map = "st" },
  ["󰒋 Prod Server"] = { type = TechnicalLinkType.PROD_SERVER, map = "sp" },
  [" Design"] = { type = TechnicalLinkType.DESIGN, map = "d" },
  [" Diff"] = { type = TechnicalLinkType.DIFF, map = "D" },
}

for action, data in pairs(actionToTechnicalLinkType) do
  keymap.set('n', '<Leader>l' .. data.map, openTechnicalLink(data.type), { desc = action, silent = true })
end

for action, data in pairs(actionToTechnicalLinkType) do
  keymap.set('n', '<Leader>v' .. data.map, openTechnicalLinkCurrent(data.type), { desc = action, silent = true })
end

-- Lookups
keymap.set('n', '<Leader>uu', lookupActions.openUsefulLink, { desc = " Useful Link", silent = true })
keymap.set('n', '<Leader>uf', fileActions.openDir, { desc = " Open File", silent = true })
keymap.set('n', '<Leader>uo', fileActions.moveFileToAsset("/Downloads"), { desc = " Move To Assets (Downloads)" })
keymap.set('n', '<Leader>ud', fileActions.moveFileToAsset("/Desktop"), { desc = " Move To Assets (Desktop)" })
keymap.set('n', '<Leader>ug', lookupActions.googleSearch, { desc = " Search", silent = true })
keymap.set('v', '<Leader>ug', lookupActions.googleSearchSelected, { desc = " Search Selected", silent = true })
keymap.set('n', '<Leader>uj', lookupActions.openJiraTicket, { desc = "󰌃 Jira Ticket", silent = true })
keymap.set('n', '<Leader>un', lookupActions.openNpmUrl, { desc = " NPM Link", silent = true })

-- Lazy
keymap.set("n", "<leader>zz", ":Lazy<CR>", { desc = "Lazy", silent = true })
keymap.set("n", "<leader>zu", ":Lazy update<CR>", { desc = "Lazy Update", silent = true })
keymap.set("n", "<leader>zr", ":Lazy restore<CR>", { desc = "Lazy Restore", silent = true })
keymap.set("n", "<leader>zc", ":Lazy clean<CR>", { desc = "Lazy Clean", silent = true })
keymap.set("n", "<leader>zh", ":Lazy health<CR>", { desc = "Lazy Health", silent = true })
keymap.set("n", "<leader>zp", ":Lazy profile<CR>", { desc = "Lazy Profile", silent = true })

-- Splits
keymap.set("n", "gP", ":split<CR>", { desc = "Hsplit", silent = true })
keymap.set("n", "gp", ":vsplit<CR>", { desc = "Vsplit", silent = true })

-- Quickfix
keymap.set("n", "gj", ":cnext<CR>", { desc = "Cnext", silent = true, noremap = true })
keymap.set("n", "gk", ":cprev<CR>", { desc = "Cprev", silent = true, noremap = true })
keymap.set("n", ";c", ":cdo s///gc<left><left><left><left>", { desc = "CDO", silent = true })

-- Buffer
keymap.set('n', '<C-l>', '<C-W><C-L>')
keymap.set('n', '<C-k>', '<C-W><C-K>')
keymap.set('n', '<C-j>', '<C-W><C-J>')
keymap.set('n', '<C-h>', '<C-W><C-H>')
keymap.set('t', '<C-l>', '<C-W><C-L>')
keymap.set('t', '<C-k>', '<C-W><C-K>')
keymap.set('t', '<C-j>', '<C-W><C-J>')
keymap.set('t', '<C-h>', '<C-W><C-H>')

-- Movement
keymap.set('n', '<Leader>i', '<C-i>', { desc = " In", silent = true })
keymap.set('n', '<Leader>o', '<C-o>', { desc = " Out", silent = true })

-- Files
keymap.set('n', '<Leader>q', ':q<CR>', { desc = "󰩈 Quit", silent = true })
keymap.set('n', '<Leader>Q', ':qa<CR>', { desc = "󰩈 Quit All", silent = true })
keymap.set('n', '<Leader>w', ':w<CR>', { desc = " Write", silent = true })
keymap.set('n', '<Leader>W', ':wa<CR>', { desc = " Write All", silent = true })

-- Search
keymap.set('v', 'ls', 'y:/<C-S-V>')

-- Remapping movement keys
keymap.set('', '<S-J>', '<C-D>')
keymap.set('', '<S-k>', '<C-U>')
