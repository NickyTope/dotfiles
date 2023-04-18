return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.move").setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = "<S-h>",
          right = "<S-l>",
          down = "<S-j>",
          up = "<S-k>",
          -- Move current line in Normal mode
          line_left = "<S-h>",
          line_right = "<S-l>",
          line_down = "<S-j>",
          line_up = "<S-k>",
        },
        -- Options which control moving behavior
        options = {
          -- Automatically reindent selection during linewise vertical move
          reindent_linewise = true,
        },
      })
      require("mini.ai").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.indentscope").setup({
        draw = {
          delay = 500,
          animation = function()
            return 5
          end,
        },
      })
      require("mini.cursorword").setup({ delay = 500 })
      require("mini.bufremove").setup()
      require("mini.jump").setup()
      require("mini.basics").setup({
        options = {
          basics = false,
        },
        mappings = {
          basics = false,
        },
        autocommands = {
          basics = true,
        },
      })
    end,
  },
}
