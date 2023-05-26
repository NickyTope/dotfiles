vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd([[
command! -nargs=1 Browse silent execute '!xdg-open' shellescape(<q-args>,1)
]])

require("ntope.settings")
require("ntope.lazy")
require("ntope.language")
require("ntope.autocommand")
require("ntope.keymaps")
require("ntope.snippets")
require("ntope.cmp-config")
