vim.cmd([[filetype plugin on]])
vim.opt.laststatus = 3
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
vim.opt.sessionoptions = "buffers"
-- " highlighted yank
vim.g.highlightedyank_highlight_duration = 500
vim.g.mapleader = " "

vim.opt.cmdheight = 0
vim.opt.shortmess:append("S")

-- vim.opt.shada = "!,<50,s10,h"
vim.cmd([[set shada="NONE"]])

-- " vim-markdown
vim.g.vim_markdown_folding_disabled = 1

-- vim.g.gruvbox_transparent_bg = true
-- vim.g.gruvbox_bold = true
-- vim.g.gruvbox_italicize_strings = true
-- vim.gruvbox_invert_selection = true
-- vim.g.gruvbox_improved_warnings = true
-- vim.g.gruvbox_improved_strings = true

vim.g.yanks_max = 1000

vim.g.gitblame_date_format = "%r"
vim.g.gitblame_enabled = 0
