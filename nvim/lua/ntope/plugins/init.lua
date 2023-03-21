return {

  -- Pretties
  "ryanoasis/vim-devicons",
  "stevearc/dressing.nvim",

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
  "vim-scripts/nginx.vim",
  "neoclide/vim-jsx-improve",

  -- tools
  "diepm/vim-rest-console",
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
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
  { "m-demare/hlargs.nvim",    config = true },
  "Shatur/neovim-session-manager",
  "mbbill/undotree",

  -- new plugins go here until confirmed ful...
  { "shortcuts/no-neck-pain.nvim", version = "*" },
}
