return {
  "booperlv/nvim-gomove",
  setup = function()
    require("gomove").setup({
      map_defaults = false,
    })
  end,
}
