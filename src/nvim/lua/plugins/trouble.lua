return {
  "folke/trouble.nvim",
  keys = {
    -- {
    --   "<leader>fe",
    --   "<cmd>Trouble diagnostics win.type = split focus=true  win.position=top<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "gu",
    --   "<cmd>Trouble lsp_references<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "gs",
    --   "<cmd>Trouble lsp_document_symbols<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "gi",
    --   "<cmd>Trouble lsp_implementations<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "gw",
    --   "<cmd>Trouble lsp_workspace_symbols<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "gW",
    --   "<cmd>Trouble lsp_dynamic_workspace_symbols<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "gd",
    --   "<cmd>Trouble lsp_definitions<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
    -- {
    --   "gt",
    --   "<cmd>Trouble lsp_type_definitions<cr>",
    --   desc = "Diagnostics (Trouble)",
    -- },
  },
  opts = {
    auto_preview = false,
    focus = true,
    restore = true,
    follow = true,
    auto_jump = true,
    keys = {
      ["?"] = "help",
      r = "refresh",
      R = "toggle_refresh",
      q = "close",
      o = "jump_close",
      ["<esc>"] = "cancel",
      ["<cr>"] = "jump",
      ["<2-leftmouse>"] = "jump",
      ["<c-s>"] = "jump_split",
      ["<c-v>"] = "jump_vsplit",
      ["gj"] = "next",
      ["gk"] = "prev",
      ["{"] = "prev",
      ["[["] = "prev",
      dd = "delete",
      d = { action = "delete", mode = "v" },
      i = "inspect",
      p = "preview",
      P = "toggle_preview",
      zo = "fold_open",
      zO = "fold_open_recursive",
      zc = "fold_close",
      zC = "fold_close_recursive",
      za = "fold_toggle",
      zA = "fold_toggle_recursive",
      zm = "fold_more",
      zM = "fold_close_all",
      zr = "fold_reduce",
      zR = "fold_open_all",
      zx = "fold_update",
      zX = "fold_update_all",
      zn = "fold_disable",
      zN = "fold_enable",
      zi = "fold_toggle_enable",
      gb = { -- example of a custom action that toggles the active view filter
        action = function(view)
          view:filter({ buf = 0 }, { toggle = true })
        end,
        desc = "Toggle Current Buffer Filter",
      },
      s = { -- example of a custom action that toggles the severity
        action = function(view)
          local f = view:get_filter("severity")
          local severity = ((f and f.filter.severity or 0) + 1) % 5
          view:filter({ severity = severity }, {
            id = "severity",
            template = "{hl:Title}Filter:{hl} {severity}",
            del = severity == 0,
          })
        end,
        desc = "Toggle Severity Filter",
      },
    },
  }, -- for default options, refer to the configuration section for custom setup.
}
