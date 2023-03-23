return {
  {
    "rmagatti/auto-session",
    setup = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/code", "~/Downloads", "/" },
      })
    end,
  },
  {
    "rmagatti/session-lens",
    config = true,
  },
}
