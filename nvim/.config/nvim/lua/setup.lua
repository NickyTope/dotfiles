local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local my_attach = function(client)
  require'completion'.on_attach(client)
  mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  mapper('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>')
  mapper('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  mapper('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
  mapper('n', '<leader>p', '<cmd>:Format<CR>')
end

require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  on_attach = function(client)
    my_attach(client)
    client.resolved_capabilities.document_formatting = false
  end,
}

require'lspconfig'.diagnosticls.setup {
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint"
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = {
          "package.json"
        },
        debounce = 100,
        args = {
          "--cache",
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    },
  }
}

require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    javascriptreact = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    json = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
            stdin = true
          }
        end
    },
    lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
  }
})

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    -- vsnip = true;
  };
}

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
