vim.cmd "filetype plugin on"
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
vim.opt.completeopt = {"menuone", "noselect"}

vim.g.gruvbox_transparent_bg = true
vim.g.gruvbox_bold = true
-- vim.g.gruvbox_italicize_strings = true
vim.gruvbox_invert_selection = true
vim.g.gruvbox_improved_warnings = true
-- vim.g.gruvbox_improved_strings = true
vim.cmd [[colorscheme gruvbox]]

-- transparency
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]

vim.g.yanks_max = 1000

-- vim.opt.titlestring = '%{expand("%:p:.")} %y %m'
-- vim.opt.tags+=.git/tags
