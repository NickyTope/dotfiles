vim.cmd([[filetype plugin on]])
vim.opt.laststatus = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.backupcopy = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hidden = true
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.title = true
-- vim.opt.titlelen = 120
vim.opt.scrolloff = 10
vim.opt.grepprg = "rg --vimgrep"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.completeopt = { "menuone", "noselect" }

-- " highlighted yank
vim.g.highlightedyank_highlight_duration = 500

-- " vim-markdown
vim.g.vim_markdown_folding_disabled = 1

vim.g.gruvbox_transparent_bg = true
vim.g.gruvbox_bold = true
vim.g.gruvbox_italicize_strings = true
vim.gruvbox_invert_selection = true
vim.g.gruvbox_improved_warnings = true
-- vim.g.gruvbox_improved_strings = true
vim.cmd([[colorscheme gruvbox]])

-- local onedarkpro = require("onedarkpro")
-- onedarkpro.setup(
--   {
--     options = {
--       transparency = true,
--       cursorline = true
--     },
--     styles = {
--       comments = "italic",
--       functions = "NONE",
--       keywords = "bold,italic",
--       strings = "NONE",
--       variables = "NONE"
--     }
--   }
-- )
-- onedarkpro.load()

-- transparency
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

vim.g.yanks_max = 1000

-- vimwiki
vim.g.vimwiki_folding = "list"
vim.g.vimwiki_key_mappings = { table_mappings = 0 }

-- prosession
vim.g.prosession_dir = "~/.config/nvim/session/"

-- closetag (auto close xml tags)
vim.g.closetag_filenames = "*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml"
vim.g.closetag_regions = {
	["typescript.tsx"] = "jsxRegion,tsxRegion",
	["javascript.jsx"] = "jsxRegion",
}

-- indent guides
vim.g.indent_guides_auto_colors = 0
vim.g.indent_guides_enable_on_vim_startup = 1
vim.cmd([[
hi IndentGuidesOdd guibg=none
hi IndentGuidesEven guibg=#3C3836
]])

-- ulti snips
vim.g.UltiSnipsExpandTrigger = "<c-k>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-k>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-j>"

-- vim-move
vim.g.move_key_modifier = "S"

-- vim-rest-console
vim.g.vrc_curl_opts = {
	["--connect-timeout"] = 5,
	["-s"] = "",
	["-i"] = "",
	["--max-time"] = 20,
	["--ipv4"] = "",
	["-k"] = "",
}

local icons = require("icons")

vim.g.dirvish_git_indicators = {
	Modified = icons.changed,
	Staged = icons.staged,
	Untracked = icons.untracked,
	Renamed = icons.moved,
	Unmerged = icons.unmerged,
	Ignored = icons.ignored,
	Unknown = icons.unknown,
}
