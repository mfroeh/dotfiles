local M = {}
M.setup = function(on_attach, capabilities)
  local lspconfig = require "lspconfig"

  lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    assist = {
      importGranularity = "module",
      importPrefix = "self",
    },
    cargo = {
      loadOutDirsFromCheck = true
    },
    procMacro = {
      enable = true
    },
    capabilities = capabilities,
  }
end

return M
