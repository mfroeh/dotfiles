-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- system clipboard
vim.opt.clipboard = "unnamedplus"

-- show matches when searching
vim.opt.hlsearch = true

-- case insensitive when lower, case sensistive if upper
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- persistent undo
vim.opt.undofile = true

-- indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 4


-- Plugins
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
