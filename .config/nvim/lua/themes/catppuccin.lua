local _M = {}

_M.init = function(opts)
  local ok, catppuccin = pcall(require, "catppuccin")
  -- On bootstrap
  if not ok then
    return
  end
  catppuccin.setup({
    transparent_background = false,
    term_colors = false,
    styles = {
      comments = "italic",
      conditionals = "italic",
      loops = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
      numbers = "NONE",
      booleans = "NONE",
      properties = "NONE",
      types = "NONE",
      operators = "NONE",
    },
    integrations = {
      treesitter = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = "italic",
          hints = "italic",
          warnings = "italic",
          information = "italic",
        },
        underlines = {
          errors = "underline",
          hints = "underline",
          warnings = "underline",
          information = "underline",
        },
      },
      lsp_trouble = false,
      cmp = true,
      lsp_saga = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      nvimtree = {
        enabled = true,
        show_root = true,
        transparent_panel = false,
      },
      neotree = {
        enabled = false,
        show_root = false,
        transparent_panel = false,
      },
      which_key = false,
      indent_blankline = {
        enabled = true,
        colored_indent_levels = false,
      },
      dashboard = true,
      neogit = false,
      vim_sneak = false,
      fern = false,
      barbar = false,
      bufferline = true,
      markdown = true,
      lightspeed = false,
      ts_rainbow = false,
      hop = false,
      notify = true,
      telekasten = true,
      symbols_outline = true,
    } })
  vim.g.catppuccin_flavour = opts.flavor -- latte, frappe, macchiato, mocha
  vim.cmd [[colorscheme catppuccin]]
end

return _M