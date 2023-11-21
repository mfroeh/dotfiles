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

-- opts = {} is equivalent to setup({})
require("lazy").setup({

  -- Generic text editing
  {
    "kylechui/nvim-surround",
    version = "*",
    init = function()
      require(
        "nvim-surround").setup()
    end
  },
  { "numToStr/Comment.nvim", init = function() require("Comment").setup() end },
  {
    "windwp/nvim-autopairs",
    init = function()
      require("nvim-autopairs").setup()
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },
  {
    "junegunn/vim-easy-align",
    init = function()
      vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)")
    end
  },

  -- Colorscheme
  { "RRethy/nvim-base16",    init = function() vim.cmd("colorscheme base16-gruvbox-dark-hard") end },

  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    init = function()
      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = { "rust_analyzer", "clangd", "lua_ls", "cmake" } })
    end
  },

  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev);
      vim.keymap.set("n", "]d", vim.diagnostic.goto_prev);

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts);
          vim.keymap.set("n", "<M-o>", "<CMD>ClangdSwitchSourceHeader<CR>");
        end
      })
      require("lspconfig").clangd.setup({
        cmd = { "clangd",
          "--clang-tidy",
          "--clang-tidy-checks=*",
          "--cross-file-rename",
          "--all-scopes-completion",
          "--fallback-style=Google" }, -- TODO: clang-tidy has no effect :(
      })
      require("lspconfig").rust_analyzer.setup({})
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").cmake.setup({})
    end
  },

  {
    "simrat39/rust-tools.nvim",
    init = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<C-.>", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end
  },

  -- Completion framework
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- LSP completion source
      "hrsh7th/cmp-nvim-lsp",
      -- Other completion sources
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
    },
    init = function()
      -- Completion Plugin Setup
      local cmp = require("cmp")
      cmp.setup({
        -- Enable LSP snippets
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          -- Add tab support
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<C-S-f>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          })
        },
        -- Installed sources:
        sources = {
          { name = "path" },                                       -- file paths
          { name = "nvim_lsp",               keyword_length = 3 }, -- from language server
          { name = "nvim_lsp_signature_help" },                    -- display function signatures with current parameter emphasized
          { name = "nvim_lua",               keyword_length = 2 }, -- complete neovim"s Lua runtime API such vim.lsp.*
          { name = "buffer",                 keyword_length = 2 }, -- source current buffer
          { name = "vsnip",                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
          { name = "calc" },                                       -- source for math calculation
        },
        window = {
          completion = { border = "" },
          documentation = { border = "" },
        },
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = "λ",
              vsnip = "⋗",
              buffer = "Ω",
              path = "🖫",
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      })
    end
  },


  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    init = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "rust", "toml", "c", "cpp" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ident = { enable = true },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Jump forward to text objects
            include_surrounding_whitespace = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
            }
          }
        }
      })
      local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
      -- vim way: ; goes to the direction you were moving.
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
    end
  },

  {
    "ibhagwan/fzf-lua",
    init = function()
      require("fzf-lua").setup({
        "max-perf",
        preview_opts = "hidden",
        buffers = { prompt = 'Buffers: ', ignore_current_buffer = true, sort_lastused = true },
        winopts = {
          border = { " ", "─", " ", " ", " ", " ", " ", " " },
          win_height = 0.5,
          win_width = 0.5,
          win_row = 0.1,
          win_col = 0.5,
        },
      })
      vim.keymap.set("n", "<C-P>", "<CMD>lua require('fzf-lua').files({})<CR>", { silent = true })
      vim.keymap.set("n", "<C-S>", "<CMD>lua require('fzf-lua').lsp_document_symbols({})<CR>", { silent = true })
    end
  },

  { "folke/todo-comments.nvim",        dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "folke/zen-mode.nvim",
    init = function()
      require("zen-mode").setup()
      vim.keymap.set("n", "<C-y>", "<CMD>ZenMode<CR>");
    end
  },
  { "hiphish/rainbow-delimiters.nvim", init = function() require("rainbow-delimiters.setup").setup() end },
})

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

vim.diagnostic.config({
  signs = true,
  underline = true,
  severity_sort = true,
  float = false, -- TODO: This has no effect
  virtual_text = {
    true,
    prefix = "●",
    severity = vim.diagnostic.severity.ERROR,
  },
  update_in_insert = false,
})

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there"s only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

vim.keymap.set("n", "<C-D>", "<C-D>zz")
vim.keymap.set("n", "<C-U>", "<C-U>zz")

vim.keymap.set("v", "<", "<gv");
vim.keymap.set("v", ">", ">gv");

-- Treesitter folding
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
