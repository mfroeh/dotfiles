local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number         = true -- Show numbers on the left
vim.opt.relativenumber = true -- Make all numbers relative to the current line

vim.opt.tabstop        = 2    -- Show tabs as 4 spaces
vim.opt.softtabstop    = 2    -- Delete spaces in quantities
vim.opt.shiftwidth     = 2    -- Number of spaces to use when using >> or auto indenting
vim.opt.expandtab      = true -- Insert spaces when using tabs or indenting
vim.opt.autoindent     = true -- Copies the indent from the current line when starting a new line
vim.opt.smartindent    = true -- Smarter autoindent

vim.opt.incsearch      = true -- Highlight matches whilst searching
vim.opt.ignorecase     = true -- Ignore case of letters when searching
vim.opt.smartcase      = true -- Ignore ignorecase if pattern contains uppercase characters

vim.opt.termguicolors  = true -- Use 24-bit colors

vim.opt.hidden         = true -- Hide buffers instead of unloading them, disables the "No write since last change" prompt
vim.opt.confirm        = true -- Prompt to save modified buffers on save

vim.opt.splitright     = true -- Always put new window to the right of current one
vim.opt.splitbelow     = true -- Always put new window below current one

vim.opt.cursorline     = true -- Highlight entire current line

vim.opt.wildmenu       = true -- Show completions options inside command mode

vim.opt.undofile       = true -- Persistent undo
vim.opt.undodir        = vim.fn.expand("~/.config/nvim/undo")

vim.opt.signcolumn     = "yes"

vim.g.mapleader        = " "
vim.g.maplocalleader   = ","

vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")

-- opts = {} is equivalent to setup({})
require("lazy").setup("plugins")
