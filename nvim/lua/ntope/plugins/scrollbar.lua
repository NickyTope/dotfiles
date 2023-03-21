return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      local palette = require("nightfox.palette").load("nightfox")
      require("scrollbar").setup({
        handle = {
          color = palette.bg4,
        },
      })
    end,
  },
}
