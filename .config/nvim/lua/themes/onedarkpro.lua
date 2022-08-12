local _M = {}

_M.init = function(opts)
  local ok, onedarkpro = pcall(require, "onedarkpro")
  -- On bootstrap
  if not ok then
    return
  end
  onedarkpro.setup({
    dark_theme = "onedark", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    theme = opts.name, -- Theme can be overwritten with 'onedark' or 'onelight' as a string
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
    styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      functions = "NONE", -- Style that is applied to functions
      variables = "NONE", -- Style that is applied to variables
      virtual_text = "NONE", -- Style that is applied to virtual text
    },
    plugins = {
      all = true
    },
    options = {
      bold = false, -- Use the themes opinionated bold styles?
      italic = false, -- Use the themes opinionated italic styles?
      underline = false, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    },
  })
  onedarkpro.load()
end

return _M
