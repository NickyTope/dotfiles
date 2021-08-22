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
    -- use 'lifepillar/vim-solarized8'
    use "arcticicestudio/nord-vim"
    -- use 'itchyny/lightline.vim'
    use "ryanoasis/vim-devicons"
    use "nathanaelkane/vim-indent-guides"
    -- use 'gruvbox-community/gruvbox'
    -- use 'morhetz/gruvbox'

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
    -- use 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm i'}
    use "neovim/nvim-lspconfig"
    use "nvim-lua/completion-nvim"
    use "hrsh7th/nvim-compe"
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use "mhartington/formatter.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "glepnir/lspsaga.nvim"
    use "hoob3rt/lualine.nvim"

    -- git
    use "tpope/vim-fugitive"
    use "tpope/vim-rhubarb"

    -- Syntax
    use "mitsuhiko/vim-jinja"
    use "yuezk/vim-js"

    -- use 'maxmellon/vim-jsx-pretty'
    use "iamcco/markdown-preview.vim"
    use "stephpy/vim-yaml"
    use "vim-scripts/groovy.vim"
    use "chrisbra/csv.vim"
    use "plasticboy/vim-markdown"
    -- required by vim-markdown
    use "godlygeek/tabular"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- tools
    use "diepm/vim-rest-console"
    use "vimwiki/vimwiki"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"
    use "jose-elias-alvarez/null-ls.nvim"

    -- new plugins go here until confirmed useful...
    -- use 'sheerun/vim-polyglot'
    use "vim-scripts/nginx.vim"
    use "neoclide/vim-jsx-improve"
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    -- Simple plugins can be specified as strings
    -- use "9mm/vim-closer"

    -- Lazy loading:
    -- Load on specific commands
    -- use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}

    -- Load on an autocommand event
    -- use {"andymass/vim-matchup", event = "VimEnter"}

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the --config-- key)
    -- use {
    --   "w0rp/ale",
    --   ft = {"sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex"},
    --   cmd = "ALEEnable",
    --   config = "vim.cmd[[ALEEnable]]"
    -- }

    -- useins can have dependencies on other plugins
    -- use {
    --   "haorenW1025/completion-nvim",
    --   opt = true,
    --   requires = {{"hrsh7th/vim-vsnip", opt = true}, {"hrsh7th/vim-vsnip-integ", opt = true}}
    -- }

    -- useins can also depend on rocks from luarocks.org:
    -- use {
    -- "my/supercoolplugin",
    -- rocks = {"lpeg", {"lua-cjson", version = "2.1.0"}}
    -- }

    -- You can specify rocks in isolation
    -- use_rocks "penlight"
    -- use_rocks {"lua-resty-http", "lpeg"}

    -- Local plugins can be included
    -- use "~/projects/personal/hover.nvim"

    -- -- useins can have post-install/update hooks
    -- use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview"}

    -- -- Post-install/update hook with neovim command
    -- use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Post-install/update hook with call of vimscript function with argument
    -- use {
    --   "glacambre/firenvim",
    --   run = function()
    --     vim.fn["firenvim#install"](0)
    --   end
    -- }

    -- Use specific branch, dependency and run lua file after load
    -- use {
    --   "glepnir/galaxyline.nvim",
    --   branch = "main",
    --   config = function()
    --     require "statusline"
    --   end,
    --   requires = {"kyazdani42/nvim-web-devicons"}
    -- }

    -- Use dependency and run lua function after load
    -- use {
    --   "lewis6991/gitsigns.nvim",
    --   requires = {"nvim-lua/plenary.nvim"},
    --   config = function()
    --     require("gitsigns").setup()
    --   end
    -- }

    -- You can specify multiple plugins in a single call
    -- use {"tjdevries/colorbuddy.vim", {"nvim-treesitter/nvim-treesitter", opt = true}}

    -- You can alias plugin names
    -- use {"dracula/vim", as = "dracula"}
  end
)
