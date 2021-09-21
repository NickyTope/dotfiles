return require("packer").startup(
  function(use)
    -- Packer can manage itself
    --
    use "wbthomason/packer.nvim"

    -- File nav
    use "justinmk/vim-dirvish"
    use "kristijanhusak/vim-dirvish-git"

    use "mbbill/undotree"
    use "tpope/vim-eunuch"

    -- Pretties
    use "ap/vim-css-color"
    use "ryanoasis/vim-devicons"
    use "nathanaelkane/vim-indent-guides"
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    -- Editor convenience
    use "tpope/vim-obsession"
    use "dhruvasagar/vim-prosession"
    use "junegunn/vim-peekaboo"
    use "tpope/vim-commentary"
    use "machakann/vim-highlightedyank"

    -- Text manilpulation
    use "tpope/vim-repeat"
    use "kana/vim-textobj-user"
    use "etdev/vim-textobject-pack"
    use "matze/vim-move"

    -- Input trickery
    use "jiangmiao/auto-pairs"
    use "alvan/vim-closetag"
    use "SirVer/ultisnips"
    use "tpope/vim-surround"
    use "NickyTope/yanks.nvim"

    -- completion
    use "neovim/nvim-lspconfig"
    use "nvim-lua/completion-nvim"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "mhartington/formatter.nvim"
    use "nvim-lua/lsp-status.nvim"
    -- use "glepnir/lspsaga.nvim"
    use "hoob3rt/lualine.nvim"
    use "hrsh7th/vim-vsnip"
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-vsnip"
      }
    }

    -- git
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    -- Syntax
    use "mitsuhiko/vim-jinja"
    use "yuezk/vim-js"
    use "iamcco/markdown-preview.vim"
    use "stephpy/vim-yaml"
    use "vim-scripts/groovy.vim"
    use "chrisbra/csv.vim"
    use {"plasticboy/vim-markdown", requires = {"godlygeek/tabular"}}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "vim-scripts/nginx.vim"
    use "neoclide/vim-jsx-improve"

    -- tools
    use "diepm/vim-rest-console"
    use "vimwiki/vimwiki"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "jose-elias-alvarez/null-ls.nvim"

    -- new plugins go here until confirmed useful...
  end
)
