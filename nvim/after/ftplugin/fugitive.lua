vim.api.nvim_create_autocmd("BufEnter", {
	buffer = vim.api.nvim_get_current_buf(),
	callback = function()
		vim.opt.cmdheight = 1
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "BufDelete" }, {
	buffer = vim.api.nvim_get_current_buf(),
	callback = function()
		vim.opt.cmdheight = 0
	end,
})
