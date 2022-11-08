require("incline").setup({
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    if bufname == "" then
      return "[No name]"
    else
      bufname = vim.fn.fnamemodify(bufname, ":t")
    end
    local icon = require("nvim-web-devicons").get_icon(bufname, nil, { default = true })
    return icon .. " " .. bufname
  end,
  window = {
    winhighlight = {
      active = {
        Normal = "Todo",
      },
      inactive = {
        Normal = "Directory",
      },
    },
  },
})
