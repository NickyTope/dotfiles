vim.g.mapleader = " "
local wk = require("which-key")

local cmd = function(txt)
  return "<cmd>" .. txt .. "<CR>"
end

local telescope = require("telescope.builtin")
local telescope_extensions = require("telescope").extensions

local symbols = function()
  telescope.symbols({ sources = { "kaomoji", "gitmoji" } })
end

local diag = function()
  telescope.diagnostics(require("telescope.themes").get_ivy({
    previewer = false
  }))
end

local format_slowly = function()
  vim.lsp.buf.format({
    filter = function(c) return c.name ~= 'tsserver' end,
    timeout_ms = 4000,
    async = true,
  })
end

local find_files = function()
  local git_ls_files = function()
    telescope.git_files(
      require("telescope.themes").get_dropdown({
        previewer = false,
        winblend = 10,
        width = 0.5,
        results_height = 15,
      }))
  end
  local rg_files = function()
    telescope.find_files(
      require("telescope.themes").get_dropdown({
        previewer = false,
        winblend = 10,
        width = 0.5,
        results_height = 15,
      }))
  end
  if not pcall(git_ls_files) then rg_files() end
end

wk.register({
  ["<leader>"] = {
    ["<leader>"] = { cmd("b#"), "Previous file" },
    ["<Esc>"] = { cmd("noh"), "Remove hl" },
    b = { telescope.buffers, "Buffer list" },
    e = { cmd("e"), "Reload file" },
    f = { telescope.live_grep, "Find in files" },
    F = { telescope.grep_string, "Find word" },
    g = {
      name = "Git",
      s = { cmd("G|18wincmd_"), "Git status" },
      l = { cmd("Glog"), "Git log" },
      f = { cmd("Git fetch"), "Git fetch" },
      r = { cmd("Git rebase"), "Git rebase" },
      p = { cmd("Git push"), "Git push" },
      b = { cmd("Git blame"), "Git blame" },
      B = { telescope.git_branches, "git branches" },
      h = { cmd("GBrowse"), "Git browse" },
      g = { telescope.git_commits, "git commits" },
    },
    h = { telescope.help_tags, "Vim help" },
    i = { require('ntope.showfilename').show, "Info (showfilename)" },
    j = { "J", "join lines" },
    l = {
      name = "LSP",
      r = { telescope.lsp_references, "References" },
      n = {
        vim.lsp.buf.rename,
        "Rename var",
      },
      d = { diag, "Diagnostix" },
      h = { vim.lsp.buf.hover, "Hover (doc)" },
      l = { vim.diagnostic.open_float, "Diagnostic float" },
      a = { vim.lsp.buf.code_action, "Code Action" },
      s = { vim.lsp.buf.signature_help, "Signature Help" },
      w = { telescope.lsp_workspace_diagnostics, "Workspace Diagnostix" },
    },
    n = { vim.diagnostic.goto_next, "Next error" },
    N = { vim.diagnostic.goto_prev, "Prev error" },
    ["mp"] = { cmd("silent !zathura /tmp/preview.pdf &"), "Open preview in Zathura" },
    ["rn"] = {
      vim.lsp.buf.rename,
      "Rename var",
    },
    o = { cmd("NvimTreeToggle"), "Toggle tree" },
    p = { format_slowly, "Format file" },
    q = {
      name = "+quickfix",
      q = { telescope.quickfix, "Telescope QF" },
      n = { cmd("cn"), "Next QF item" },
      b = { cmd("cb"), "Prev QF item" },
      c = { cmd("cclo"), "Close QF" },
      o = { cmd("copen"), "Open QF" },
    },
    s = { symbols, "Symbols" },
    ["uh"] = { cmd("UndotreeShow") .. cmd("UndotreeFocus"), "Undo tree" },
    v = { '"+p', "Paste system clip" },
    y = { telescope_extensions.neoclip.default, "Yank list" },
  },
})

local map = vim.keymap.set

local nmap = function(key, result, opts)
  map("n", key, result, opts)
end

local imap = function(key, result, opts)
  map("i", key, result, opts)
end

vim.keymap.set("i", "<c-l>", function()
  vim.lsp.buf.signature_help()
end)

nmap("Q", cmd("q"), {})
nmap("Y", "yy", {})
-- nmap("x", '"_x', {})
-- nmap("<del>", '"_x', {})
nmap("<a-o>", "o<esc>", {})
nmap("<a-O>", "O<esc>", {})
nmap("gp", "'[v']", {})
nmap("<c-p>", find_files, {})
nmap("{", cmd("keepjumps normal! {"), {})
nmap("}", cmd("keepjumps normal! }"), {})
nmap("<c-s>", cmd("w"), { silent = true })
nmap("-", cmd("NvimTreeFindFile"), {})

map("n", "<c-_>", cmd("lua require'Comment.api'.toggle_current_linewise_op()"))
map("x", "<c-_>", "<Esc>" .. cmd("lua require'Comment.api'.locked.toggle_linewise_op(vim.fn.visualmode())"))

-- window movement
map("", "<a-h>", cmd("wincmd h"), {})
map("", "<a-j>", cmd("wincmd j"), {})
map("", "<a-k>", cmd("wincmd k"), {})
map("", "<a-l>", cmd("wincmd l"), {})

imap("<F6>", "h", {})
imap("<c-s>", "<esc>" .. cmd("w"), { silent = true })
imap("jk", "<esc>", {})
imap("kj", "<esc>", {})

map("v", "cp", '"+y', {})
map("v", "<c-c>", '"+y', {})

-- no idea how to port these, let's just cmd them
-- vim.cmd([[ nnoremap _ :vsp <c-r>=expand("%:.:h")<cr><cr> ]])
vim.cmd([[ nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR> ]])
