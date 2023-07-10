vim.cmd([[
au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy
au BufNewFile,BufRead *html.mustache set ft=html
au BufNewFile,BufRead *.conf set ft=nginx
au BufNewFile,BufRead *.yuck set ft=lisp
au BufNewFile,BufRead dunstrc set ft=dosini
au BufWritePost *.md silent !pandoc -o /tmp/preview.pdf %
autocmd BufRead,BufNewFile */templates/*.yml,*/templates/*.tpl,*.gotmpl,helmfile*.yml set ft=helm
]])

-- zmk
vim.cmd([[
au BufNewFile,BufRead *.keymap set syntax=dts
au BufNewFile,BufRead *.overlay set syntax=dts
]])

vim.cmd([[
autocmd FileType scss setlocal commentstring=/*\ %s\ */
]])

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "NvimTree*",
  callback = function()
    local api = require("nvim-tree.api")
    local view = require("nvim-tree.view")

    if not view.is_visible() then
      api.tree.open()
    end
  end,
})

local grp = vim.api.nvim_create_augroup("highlight_yank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = grp,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
  end,
})
