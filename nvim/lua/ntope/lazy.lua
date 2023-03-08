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

require("lazy").setup({

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local nightfox = require("nightfox")
      nightfox.setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            -- functions = "NONE",
            -- conditionals = "NONE",
            -- constants = "NONE",
            -- numbers = "NONE",
            operators = "italic",
            -- strings = "NONE",
            types = "italic",
            -- variables = "bold",
          },
        },
      })
      vim.cmd([[colorscheme nightfox]])

      -- transparency
      vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

      -- window separator
      vim.cmd([[hi Winseparator guifg=#9d79d6]])
    end,
  },

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
  },

  -- Pretties
  "ryanoasis/vim-devicons",
  "stevearc/dressing.nvim",
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup({
        render = function(props)
          local bufname = vim.api.nvim_buf_get_name(props.buf)
          if bufname == "" then
            return "[No name]"
          else
            bufname = vim.fn.fnamemodify(bufname, ":t")
          end
          local icon = require("nvim-web-devicons").get_icon(bufname, nil, { default = true })
          return icon .. " " .. bufname
        end,
        window = {
          winhighlight = {
            active = {
              Normal = "Todo",
            },
            inactive = {
              Normal = "Directory",
            },
          },
        },
      })
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    config = function()
      local palette = require("nightfox.palette").load("nightfox")
      require("scrollbar").setup({
        handle = {
          color = palette.bg4,
        },
      })
    end,
  },
  {
    "samodostal/image.nvim",
    config = function()
      require("image").setup({
        render = {
          min_padding = 2,
          show_label = true,
          use_dither = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      })
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background",
      })
    end,
  },

  -- Editor convenience
  "machakann/vim-highlightedyank",
  { "folke/which-key.nvim",  config = true },

  -- Text manilpulation
  "kana/vim-textobj-user",
  "etdev/vim-textobject-pack",
  { "numToStr/Comment.nvim", config = true },

  -- Input trickery
  "jiangmiao/auto-pairs",
  "alvan/vim-closetag",
  "L3MON4D3/LuaSnip",
  "machakann/vim-sandwich",
  "booperlv/nvim-gomove",

  -- LSP
  "neovim/nvim-lspconfig",
  "nvim-lua/completion-nvim",
  "nvim-lua/lsp-status.nvim",
  "hoob3rt/lualine.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
  },

  -- git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  { "f-person/git-blame.nvim", dependencies = { "f-person/lua-timeago" } },

  -- Syntax
  { "mitsuhiko/vim-jinja",     ft = "jinja" },
  "yuezk/vim-js",
  { "stephpy/vim-yaml",        ft = "yaml" },
  { "vim-scripts/groovy.vim",  ft = "groovy" },
  { "chrisbra/csv.vim",        ft = "csv" },
  { "plasticboy/vim-markdown", ft = "markdown", dependencies = { "godlygeek/tabular" } },
  "nvim-treesitter/nvim-treesitter",
  "vim-scripts/nginx.vim",
  "neoclide/vim-jsx-improve",

  -- tools
  "diepm/vim-rest-console",
  { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },
  "AckslD/nvim-neoclip.lua",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "tami5/sqlite.lua",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
        _treesitter = true,
        show_first_indent_level = false,
      })
    end,
  },
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-treesitter/nvim-treesitter-textobjects",
  { "m-demare/hlargs.nvim",     config = true },
  "Shatur/neovim-session-manager",
  "mbbill/undotree",

  -- new plugins go here until confirmed ful...
  { "shortcuts/no-neck-pain.nvim", version = "*" },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,    -- use a classic bottom cmdline for search
          command_palette = true,  -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,      -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,  -- add a border to hover docs and signature help
        },
        views = {
          cmdline_popup = {
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
      })
    end,
  },
})
