local nvimtree = require("nvim-tree")

-- Switch to previous window if in nvim-tree
local function previous_window()
  local buf_name = vim.api.nvim_buf_get_name(0)
  if string.find(buf_name, "NvimTree") then 
    vim.cmd "wincmd p"
  end
end

require("mappings").keymap("n", "<leader>e", ":NvimTreeFocus<CR>")
require("mappings").keymap("n", "<esc>", previous_window)

local ithunk = function(fn, ...)
  local bound = { ... }
  return function()
    return fn(unpack(bound))
  end
end

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

local nvim_tree_config = require "nvim-tree.config"
local tree_cb = nvim_tree_config.nvim_tree_callback

nvimtree.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  sort_by = "name",
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false
      }
    },
    add_trailing = true,
    special_files = {}
  },
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = signs.Hint,
      info = signs.Info,
      warning = signs.Warning,
      error = signs.Error,
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {
      "^.git$",
    },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 35,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = "v", cb = tree_cb "vsplit" },
        { key = "h", cb = tree_cb "vsplit" },

        { key = "H", action = "" },
        { key = "<C-t>", action = "" },
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    },
  },
}
