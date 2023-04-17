return {

  -- Pretties
  "ryanoasis/vim-devicons",

  -- Editor convenience
  "machakann/vim-highlightedyank",
  { "folke/which-key.nvim",    config = true },

  -- Text manilpulation
  "kana/vim-textobj-user",
  "etdev/vim-textobject-pack",

  -- Input trickery
  "alvan/vim-closetag",
  "L3MON4D3/LuaSnip",
  -- "machakann/vim-sandwich",

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
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "tami5/sqlite.lua",
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = false,
        show_current_context_start = false,
        _treesitter = true,
        show_first_indent_level = false,
      })
    end,
  },
  "nvim-telescope/telescope-symbols.nvim",
  "nvim-treesitter/nvim-treesitter-textobjects",
  { "m-demare/hlargs.nvim",        config = true },
  "mbbill/undotree",

  -- new plugins go here until confirmed ful...
  { "shortcuts/no-neck-pain.nvim", version = "*" },
  { "nvim-pack/nvim-spectre",      config = true },
}
