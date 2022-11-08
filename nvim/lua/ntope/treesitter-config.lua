require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "scss",
    "typescript",
    "vim",
    "yaml",
    "markdown",
    "help",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = false,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["<leader>gd"] = "@function.outer",
        ["<leader>gD"] = "@class.outer",
      },
    },
  },
})
