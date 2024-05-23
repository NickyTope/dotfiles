return {
	"dmmulroy/tsc.nvim",
	config = true,
	opts = {
		auto_open_qflist = true,
		auto_close_qflist = false,
		auto_focus_qflist = true,
		auto_start_watch_mode = false,
		use_trouble_qflist = false,
		run_as_monorepo = false,
		-- bin_path = utils.find_tsc_bin(),
		enable_progress_notifications = true,
		-- flags = {
		-- 	noEmit = true,
		-- 	project = function()
		-- 		return utils.find_nearest_tsconfig()
		-- 	end,
		-- 	watch = false,
		-- },
		hide_progress_notifications_from_history = true,
		spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
		pretty_errors = true,
	},
}
