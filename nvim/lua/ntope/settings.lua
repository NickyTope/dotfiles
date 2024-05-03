vim.cmd([[filetype plugin on]])
vim.opt.laststatus = 3
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.mouse = "a"
vim.opt.backupcopy = "yes"
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
-- vim.opt.showmode = false
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
vim.opt.signcolumn = "number"
vim.opt.completeopt = { "menuone", "noselect" }
-- " highlighted yank
vim.g.highlightedyank_highlight_duration = 500
vim.g.mapleader = " "

vim.o.sessionoptions = "curdir,buffers,winsize"

vim.opt.cmdheight = 0
vim.opt.shortmess:append("S")

vim.cmd([[set shada='10,<10,/50,:50,s10,h]])

-- " vim-markdown
vim.g.vim_markdown_folding_disabled = 1

vim.g.yanks_max = 1000

vim.g.gitblame_date_format = "%r"
vim.g.gitblame_enabled = 0
