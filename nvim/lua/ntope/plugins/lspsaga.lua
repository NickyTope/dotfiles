return {
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        definition = {
          edit = "<CR>",
          vsplit = "v",
          quit = "q",
        },
        lightbulb = {
          enable = true,
          enable_in_insert = true,
          sign = false,
          virtual_text = true,
        },
        rename = {
          quit = "q",
          exec = "<CR>",
          mark = "x",
          confirm = "<CR>",
          in_select = true,
        },
        code_action = {
          num_shortcut = true,
          show_server_name = false,
          extend_gitsigns = true,
          keys = {
            quit = "q",
            exec = "<CR>",
          },
        },
      })
    end,
  },
}
