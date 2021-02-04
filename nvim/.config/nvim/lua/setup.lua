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

-- require'lspconfig'.tsserver.setup{
--   on_attach = function(client)
--     my_attach(client)
--     client.resolved_capabilities.document_formatting = false
--   end
-- }

-- require'lspconfig'.diagnosticls.setup {
--   filetypes = {"javascript", "typescript"},
--   init_options = {
--     linters = {
--       eslint = {
--         command = "eslint",
--         rootPatterns = {".git"},
--         debounce = 100,
--         args = {
--           "--stdin",
--           "--stdin-filename",
--           "%filepath",
--           "--format",
--           "json"
--         },
--         sourceName = "eslint",
--         parseJson = {
--           errorsRoot = "[0].messages",
--           line = "line",
--           column = "column",
--           endLine = "endLine",
--           endColumn = "endColumn",
--           message = "${message} [${ruleId}]",
--           security = "severity"
--         },
--         securities = {
--           [2] = "error",
--           [1] = "warning"
--         }
--       },
--       filetypes = {
--         javascript = "eslint",
--         javascriptreact = "eslint"
--       }
--     }
--   }
-- }

local sumneko_install = "/home/nicky/apps/lua-language-server/"

require'lspconfig'.sumneko_lua.setup{
  on_attach=my_attach,
  cmd={sumneko_install.."bin/Linux/lua-language-server", "-E", sumneko_install.."main.lua"}
}
--
-- require'lspconfig'.pyls.setup{on_attach=my_attach}
require'lspconfig'.vimls.setup{on_attach=my_attach}
