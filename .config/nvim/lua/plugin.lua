local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugin.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have package manager itself

  -- use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins

  -- Themes and icons
  use "kyazdani42/nvim-web-devicons" -- Icons for bufferline, lualine and nvim-tree
  use "lunarvim/colorschemes" -- Many colorschemes
  use "folke/tokyonight.nvim" -- Tokyonight colorscheme
  use "sainnhe/gruvbox-material" -- Gruvbox with material palette
  use "rmehri01/onenord.nvim"
  use "olimorris/onedarkpro.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Lines
  use "akinsho/bufferline.nvim" -- Bufferline shows buffers and tabs on top
  if not PACKER_BOOTSTRAP then require "plugins.bufferline" end
  use "nvim-lualine/lualine.nvim" -- Powerline
  if not PACKER_BOOTSTRAP then require "plugins.lualine" end

  -- File tree
  use "kyazdani42/nvim-tree.lua" -- Tree file explorer
  if not PACKER_BOOTSTRAP then require "plugins.nvim-tree" end

  -- Fuzzy finding
  use "nvim-telescope/telescope.nvim" -- Telescope
  if not PACKER_BOOTSTRAP then require "plugins.telescope" end

  -- Automatically pair parentheses
  use "windwp/nvim-autopairs" -- Autopairs
  if not PACKER_BOOTSTRAP then require "plugins.autopairs" end

  -- Indent blank lines
  -- use "lukas-reineke/indent-blankline.nvim"

  -- Comments
  use "numToStr/Comment.nvim" -- Easily comment stuff
  if not PACKER_BOOTSTRAP then require "plugins.comment" end

  -- HTML-Colors
  use "norcalli/nvim-colorizer.lua"
  if not PACKER_BOOTSTRAP then require "plugins.colorizer" end

  -- Syntax highlighting
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- Treesitter for syntax highlighting
  use "p00f/nvim-ts-rainbow" -- Parentheses in different colors
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Context aware comments
  use "windwp/nvim-ts-autotag" -- Auto tags for xml
  if not PACKER_BOOTSTRAP then require "plugins.treesitter" end
  
  -- % for language structures
  use "andymass/vim-matchup" 
  vim.g.loaded_matchit = 1

  -- LSP
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- Simple to use language server installer

  use "ray-x/lsp_signature.nvim" -- LSP powered function signatures
  use "folke/trouble.nvim"
  if not PACKER_BOOTSTRAP then require "plugins.trouble" end

  -- Completion plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-nvim-lua" -- Completion for config file
  use "hrsh7th/cmp-nvim-lsp" -- LSP completion
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completion
  use "hrsh7th/vim-vsnip" -- Enable vsnip as snippet engine
  use "hrsh7th/cmp-vsnip" -- Integrate vsnip into cmp
  -- use "hrsh7th/cmp-cmdline" -- Cmdline completions
  -- use "hrsh7th/cmp-nvim-lsp-document-symbol" -- Search completions
  -- use "hrsh7th/cmp-nvim-lsp-signature-help" -- Functions signatures
  if not PACKER_BOOTSTRAP then require "plugins.cmp" end

  -- Snippets
  use "kitagry/vs-snippets"

  -- Toggleable terminal
  use "akinsho/toggleterm.nvim" -- Toggle terminal
  if not PACKER_BOOTSTRAP then require "plugins.toggleterm" end

  -- Autosession
  -- use "rmagatti/auto-session" -- Restores last session when opened via 'nvim'
  -- if not PACKER_BOOTSTRAP then require "plugins.auto-sesion" end

  -- Git
  use "lewis6991/gitsigns.nvim"
  if not PACKER_BOOTSTRAP then require "plugins.gitsigns" end

  use "goolord/alpha-nvim"
  if not PACKER_BOOTSTRAP then require "plugins.alpha" end

  use "ur4ltz/surround.nvim"
  if not PACKER_BOOTSTRAP then require "plugins.surround" end

  -- -- Language specific plugins
  -- Rust
  use "simrat39/rust-tools.nvim" -- Additional tools for rust
  if not PACKER_BOOTSTRAP then require "plugins.rust.rust-tools" end

  -- Markdown
  use "davidgranstrom/nvim-markdown-preview"
  if not PACKER_BOOTSTRAP then require "plugins.markdown.markdown-preview" end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
