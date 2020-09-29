local mapper = function(mode, key, result)
  vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true })
end

local my_attach = function(client)
  require'completion'.on_attach(client)
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
end

require'nvim_lsp'.sumneko_lua.setup{
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
      diagnostics = { enable = true, globals = { "vim" } },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        }
      }
    }
  },
  on_attach=my_attach
}

-- TS SERVER
-- require'nvim_lsp'.tsserver.setup{on_attach=my_attach}

-- PYLS
require'nvim_lsp'.pyls.setup{on_attach=my_attach}
require'nvim_lsp'.vimls.setup{}
