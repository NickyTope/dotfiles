local prettierFmt = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
		stdin = true,
	}
end

local eslintFmt = function()
	return {
		exe = "eslint_d",
		args = { "--stdin", "--cache", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix-to-stdout" },
		stdin = true,
	}
end

local stylelintFmt = function()
	return {
		exe = "stylelint",
		args = { "--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix" },
		stdin = true,
	}
end

local yamlFmt = function()
	return {
		exe = "yamlfmt",
		args = { vim.api.nvim_buf_get_name(0) },
		stdin = false,
	}
end

local pythonFmt = function()
	return {
		exe = "autopep8",
		args = { "--in-place", vim.api.nvim_buf_get_name(0) },
		stdin = false,
	}
end

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = { eslintFmt },
		javascriptreact = { eslintFmt },
		typescript = { eslintFmt },
		markdown = { prettierFmt },
		json = { prettierFmt },
		scss = { stylelintFmt },
		css = { stylelintFmt },
		yaml = { yamlFmt },
		python = { pythonFmt },
		lua = {
			-- luafmt
			function()
				return {
					exe = "luafmt",
					args = { "--indent-count", 2, "--stdin" },
					stdin = true,
				}
			end,
		},
	},
})
