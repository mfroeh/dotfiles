local bufferline = require "bufferline"

bufferline.setup {
  options = {
    mode = "buffers",
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 25,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_buffer_default_icon = true,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = { "", "" },
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = "insert_at_end",
  }
}
