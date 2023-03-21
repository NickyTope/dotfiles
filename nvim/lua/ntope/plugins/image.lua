return {
  {
    "samodostal/image.nvim",
    config = function()
      require("image").setup({
        render = {
          min_padding = 2,
          show_label = true,
          use_dither = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      })
    end,
  },
}
