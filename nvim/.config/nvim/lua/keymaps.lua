vim.g.mapleader = " "
local nest = require("nest")

local cmd = function(txt)
  return "<cmd>" .. txt .. "<CR>"
end

local telescope = require("telescope.builtin")

vim.cmd [[ nnoremap _ :vsp <c-r>=expand("%:.:h")<cr><cr> ]]
vim.cmd [[ nnoremap <c-p> <cmd>lua require'telescope.builtin'.git_files{cwd=vim.fn.expand('%:h')}<cr> ]]
vim.cmd [[ nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR> ]]

nest.applyKeymaps {
  {
    "<leader>",
    options = {noremap = true},
    {
      -- files
      {"o", cmd("e .")},
      {"e", cmd("e")},
      {"<leader>", cmd("b#")},
      -- lsp
      {"n", vim.lsp.diagnostic.goto_next},
      {"N", vim.lsp.diagnostic.goto_prev},
      {"rn", vim.lsp.buf.rename},
      {"s", vim.lsp.buf.signature_help},
      {"p", cmd("Format")},
      -- telescope
      {"ca", telescope.lsp_code_actions},
      {"f", telescope.live_grep},
      {"F", telescope.grep_string},
      {"b", telescope.buffers},
      {"i", telescope.oldfiles},
      {"qq", telescope.quickfix},
      {"d", telescope.lsp_document_diagnostics},
      {"gr", telescope.lsp_references},
      -- random
      {"j", "J"},
      {".", "'."},
      {"v", '"+p'},
      {"<Esc>", cmd("noh")},
      -- quickfix
      {"qn", cmd("cn")},
      {"qb", cmd("cp")},
      {"qc", cmd("cclose")},
      {"qo", cmd("copen")},
      -- git
      {"gs", cmd("G")},
      {"gl", cmd("Glog")},
      {"gf", cmd("Git fetch")},
      {"gr", cmd("Git rebase")},
      {"gp", cmd("Git push")},
      {"gb", cmd("Git blame")},
      {"gh", cmd("GBrowse")},
      -- undotree
      {"uh", cmd("UndotreeShow") .. cmd("UndotreeFocus")}
    }
  },
  -- random things
  {"Q", cmd("q")},
  {"<A-o", "o<Esc>"},
  {"<A-O", "O<Esc>"},
  {"<Del>", '"_x'},
  {"x", '"_x'},
  {"gp", "'[v']"},
  {"Y", "yy"},
  {"<c-p>", telescope.git_files},
  {"}", cmd("keepjumps normal! }")},
  {"{", cmd("keepjumps normal! {")},
  {"<c-s>", "<Esc>:w<CR>", mode = "ni", options = {silent = true}},
  {"<c-y>", "<Plug>(Yanks)"},
  {"<c-/>", "gcc"},
  -- window movement
  {
    mode = "tn",
    {"<a-h>", cmd("wincmd h")},
    {"<a-j>", cmd("wincmd j")},
    {"<a-k>", cmd("wincmd k")},
    {"<a-l>", cmd("wincmd l")}
  },
  {
    mode = "i",
    {
      {"jk", "<Esc>"},
      {"kj", "<Esc>"},
      {"<F6>", "h"}
    }
  },
  {
    mode = "v",
    {
      {"<c-c>", '"+y'},
      {"cp", '"+y'}
    }
  }
}
