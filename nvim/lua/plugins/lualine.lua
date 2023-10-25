local lualine = require "lualine"

local powerline = {
  circle = {
    left = "",
    right = "",
  },
  arrow = {
    left = "",
    right = "",
  },
  triangle = {
    left = "",
    right = "",
  },
  none = {
    left = "",
    right = "",
  },
}

local colors = {
  bg = "#282c34",
  fg = "#abb2bf",
  red = "#e06c75",
  orange = "#d19a66",
  yellow = "#e5c07c",
  blue = "#61afef",
  green = "#98c379",
  cyan = "#56b6c2",
  magenta = "#c678dd",
  pink = "#FFA19F",
  grey1 = "#f8fafc",
  grey2 = "#f0f1f4",
  grey3 = "#eaecf0",
  grey4 = "#d9dce3",
  grey5 = "#c4c9d4",
  grey6 = "#b5bcc9",
  grey7 = "#929cb0",
  grey8 = "#8e99ae",
  grey9 = "#74819a",
  grey10 = "#616d85",
  grey11 = "#464f62",
  grey12 = "#3a4150",
  grey13 = "#333a47",
  grey14 = "#242932",
  grey15 = "#1e222a",
  grey16 = "#1c1f26",
  grey17 = "#0f1115",
  grey18 = "#0d0e11",
  grey19 = "#020203",
}

local mode_color = {
  n = colors.cyan,
  i = colors.green,
  v = colors.magenta,
  V = colors.magenta,
  c = colors.red,
  no = colors.magenta,
  s = colors.orange,
  [""] = colors.orange,
  ic = colors.yellow,
  R = colors.magenta,
  Rv = colors.magenta,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.red,
  t = colors.red,
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    globalstatus = true,
    component_separators = "",
    section_separators = "",
    theme = {
      normal = { c = { fg = colors.grey9, bg = colors.grey13 } },
      inactive = { c = { fg = colors.grey9, bg = colors.bg } },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

local function ins_left_inactive(component)
  table.insert(config.inactive_sections.lualine_c, component)
end

local function ins_right_inactive(component)
  table.insert(config.inactive_sections.lualine_x, component)
end

ins_left {
  function()
    vim.api.nvim_command("hi LualineViModeStart guibg=" .. mode_color[vim.fn.mode()])
    return " "
  end,
  color = "LualineViModeStart",
  padding = { right = 0 },
}

ins_left {
  function()
    vim.api.nvim_command(
      "hi LualineViMode guifg="
      .. mode_color[vim.fn.mode()]
      .. " guibg="
      .. colors.grey14
      .. " gui=bold cterm=bold"
    )
    return require("lualine.utils.mode").get_mode()
  end,
  icons_enabled = true,
  color = "LualineViMode",
  padding = { right = 1, left = 1 },
}

ins_left {
  function()
    return powerline.triangle.right
  end,
  color = { fg = colors.grey14, bg = colors.grey13 },
  padding = 0,
}

ins_left {
  "filetype",
  fmt = string.upper,
  icons_enabled = true,
  color = { fg = colors.grey9, bg = colors.grey13 },
}

ins_left {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9, gui = "italic" },
}

ins_left {
  "filesize",
  icon = "",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9 },
}

-- ins_left { "location", icon = "", color = { fg = colors.grey9 } }

-- ins_left { "progress", color = { fg = colors.grey9, gui = "bold" } }

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

ins_left {
  function()
    return "%="
  end,
}

ins_right {
  function()
    local msg = ""
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
        return client.name
      end
    end
    return msg
  end,
  icon = "",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9 },
}

-- Add components to right sections
ins_right {
  "o:encoding",
  fmt = string.upper,
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9 },
}

ins_right {
  "fileformat",
  fmt = string.upper,
  cond = conditions.buffer_not_empty,
  icons_enabled = true,
  color = { fg = colors.grey9 },
}

ins_right {
  function()
    return vim.opt.tabstop:get()
  end,
  icon = "הּ",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9 },
}

ins_right {
  function()
    return powerline.triangle.left
  end,
  color = { fg = colors.grey14, bg = colors.grey13 },
  cond = conditions.check_git_workspace,
  padding = 0,
}

ins_right {
  "branch",
  icon = "",
  cond = conditions.check_git_workspace,
  color = { fg = colors.magenta, bg = colors.grey14, gui = "bold" },
}

ins_right {
  "diff",
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = colors.green, bg = colors.grey14 },
    modified = { fg = colors.orange, bg = colors.grey14 },
    removed = { fg = colors.red, bg = colors.grey14 },
  },
}

ins_right {
  function()
    vim.api.nvim_command("hi LualineViModeEnd guibg=" .. mode_color[vim.fn.mode()])
    return " "
  end,
  color = "LualineViModeEnd",
  padding = { right = 0 },
}

-- Inactive
ins_left_inactive {
  function()
    return " "
  end,
  color = { bg = colors.grey9 },
  padding = { right = 0 },
}

ins_left_inactive {
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.grey9, bg = colors.grey14, gui = "bold" },
}

ins_left_inactive {
  function()
    return powerline.triangle.right
  end,
  color = { fg = colors.grey14, bg = colors.bg },
  padding = 0,
}

lualine.setup(config)
