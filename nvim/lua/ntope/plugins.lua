return require("packer").startup(function(use)
  -- Packer can manage itself
  --
  use("wbthomason/packer.nvim")

  use("mbbill/undotree")
  -- use("tpope/vim-eunuch")

  -- Pretties
  -- use("ap/vim-css-color")
  use("ryanoasis/vim-devicons")
  use("EdenEast/nightfox.nvim")

  -- Editor convenience
  use("machakann/vim-highlightedyank")
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })

  -- Text manilpulation
  use("kana/vim-textobj-user")
  use("etdev/vim-textobject-pack")

  -- Input trickery
  use("jiangmiao/auto-pairs")
  use("alvan/vim-closetag")
  use("L3MON4D3/LuaSnip")

  -- LSP
  use("neovim/nvim-lspconfig")
  use("nvim-lua/completion-nvim")
  use("nvim-lua/lsp-status.nvim")
  use("hoob3rt/lualine.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim",
    },
  })

  -- git
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")

  -- Syntax
  use("mitsuhiko/vim-jinja")
  use("yuezk/vim-js")
  use("stephpy/vim-yaml")
  use("vim-scripts/groovy.vim")
  use("chrisbra/csv.vim")
  use({ "plasticboy/vim-markdown", requires = { "godlygeek/tabular" } })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("vim-scripts/nginx.vim")
  use("neoclide/vim-jsx-improve")

  -- tools
  use("diepm/vim-rest-console")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-ui-select.nvim")
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
        use_treesitter = true,
        show_first_indent_level = false,
      })
    end,
  })
  use("nvim-telescope/telescope-symbols.nvim")

  -- new plugins go here until confirmed useful...
  use("tami5/sqlite.lua")
  use("AckslD/nvim-neoclip.lua")
  use("machakann/vim-sandwich")
  use("booperlv/nvim-gomove")
  use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use({
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup()
    end,
  })
  use("Shatur/neovim-session-manager")
  use("stevearc/dressing.nvim")
  use("b0o/incline.nvim")
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  use("petertriho/nvim-scrollbar")
  use("NickyTope/nvim-highlight-colors")
  use("samodostal/image.nvim")
end)
