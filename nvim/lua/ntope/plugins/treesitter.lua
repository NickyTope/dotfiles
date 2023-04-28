return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "comment",
          "css",
          "dockerfile",
          "go",
          "help",
          "html",
          "http",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "scss",
          "tsx",
          "typescript",
          "vim",
          "yaml",
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
            peek_definition_code = {
              ["<leader>gd"] = "@function.outer",
              ["<leader>gD"] = "@class.outer",
            },
          },
        },
      })
    end,
  },
}
