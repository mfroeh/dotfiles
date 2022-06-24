local configs = require "nvim-treesitter.configs"

configs.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  matchup = {
    enable = true,
    disable_virtual_text = false, -- Do not use virtual text to highlight the virtual end of a block, for languages without explicit end markers (e.g., Python).
    -- include_match_words -- Additionally include traditional vim regex matches for symbols. For example, highlights /* */ comments in C++ which are not supported in tree-sitter matching.
  }
}
