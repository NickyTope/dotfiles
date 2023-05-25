return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local icons = require("ntope.icons")
      require("nvim-tree").setup({
        hijack_unnamed_buffer_when_opening = true,
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
      })
    end,
  },
}
