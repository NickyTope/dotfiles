return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_root_dir = "/home/nicky/.local/share/nvim/sessions/",
        auto_session_suppress_dirs = { "~/", "~/code", "~/code/boards", "~/Downloads", "/" },
      })
    end,
  },
}
