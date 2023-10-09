local opts = { noremap = true, silent = true, nowait = true }

-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set

-- Leader keys
vim.g.mapleader = ","
vim.g.maplocaleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers --
keymap("n", "<S-h>", ":bprevious <CR>", opts)
keymap("n", "<S-l>", ":bnext <CR>", opts)

-- keymap("n", "<leader>x", ":bdelete <CR>", opts)

-- Quit all --
keymap("n", "<C-q>", ":quitall<CR>", opts)

-- Insert --
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

local _M = {}
_M.keymap = function(mode, binding, command, other_opts)
  other_opts = other_opts or opts
  keymap(mode, binding, command, other_opts)
end
return _M
