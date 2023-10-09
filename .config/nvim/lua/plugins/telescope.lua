local telescope = require "telescope"

-- require("mappings").keymap("n", "<leader>f", "<cmd>find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")
require("mappings").keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>")
require("mappings").keymap("n", "<leader>gr", "<cmd>Telescope live_grep<CR>")

local actions = require "telescope.actions"

telescope.setup {
  defaults = {
    prompt_prefix = "     ",
    selection_caret = " ",
    path_display = { "smart" },
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
        horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
        },
        vertical = {
            mirror = false,
        },
        width = 0.8,
        height = 0.8,
        preview_cutoff = 120,
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}
}
