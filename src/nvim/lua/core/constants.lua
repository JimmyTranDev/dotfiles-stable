local TechnicalLinkType = require("custom.lookup.constants").technicalLinkField

-- Location Vartiables
local expand = vim.fn.expand
local HOME = expand('$HOME')
local NEOVIM_STATE_DIR = expand('$HOME/.local/state/nvim/')
local PROGRAMMING_DIR = expand('$HOME/Programming')

-- Catpuccin color scheme
local colors = {
  rosewater = '#f5e0dc',
  flamingo = '#f2cdcd',
  pink = '#f5c2e7',
  mauve = '#cba6f7',
  red = '#f38ba8',
  maroon = '#eba0ac',
  peach = '#fab387',
  yellow = '#f0c987',
  green = '#a6e3a1',
  teal = '#94e2d5',
  sky = '#89dceb',
  sapphire = '#74c7ec',
  blue = '#89b4fa',
  lavender = '#b4befe',
  text = '#cdd6f4',
  subtext1 = '#bac2de',
  subtext0 = '##a6adc8',
  overlay2 = '#9399b2',
  overlay1 = '#7f849c',
  overlay0 = '#6c7086',
  surface2 = '#585b70',
  surface1 = '#45475a',
  surface0 = '#313244',
  base = '#1e1e2e',
  mantle = '#181825',
  crust = '#11111b'
}

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

return {
  HOME = HOME,
  NEOVIM_STATE_DIR = NEOVIM_STATE_DIR,
  PROGRAMMING_DIR = PROGRAMMING_DIR,
  colors = colors,
  actionToTechnicalLinkType = actionToTechnicalLinkType
}
