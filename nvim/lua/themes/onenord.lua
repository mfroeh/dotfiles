local _M = {}

_M.init = function(opts)
  local ok, onenord = pcall(require, "onenord")
  -- On bootstrap
  if not ok then
    return
  end
  onenord.setup {
    borders = true,
    fade_nc = false,
    styles = {
      comments = "italic",
      strings = "NONE",
      keywords = "NONE",
      functions = "italic",
      variables = "NONE", -- bold
      diagnostics = "underline",
    },
    disable = {
      background = false,
      cursorline = false,
      eob_lines = true,
    },
  }
end

return _M
