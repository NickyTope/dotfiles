local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_status = require("lsp-status")
lsp_status.config(
  {
    indicator_errors = "🚫",
    indicator_warnings = "⚠️",
    indicator_info = "ℹ️",
    indicator_hint = "📣",
    indicator_ok = "🚀"
  }
)
lsp_status.register_progress()
local function stat()
  return lsp_status.status()
end

require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}

local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.send_to_qflist
      }
    }
  }
}

require "lualine".setup {
  sections = {
    lualine_x = {"filetype"},
    lualine_y = {stat},
    lualine_z = {"location", "progress"}
  },
  options = {
    theme = "gruvbox"
  }
}

local my_attach = function(client)
  require "completion".on_attach(client)
  lsp_status.on_attach(client)
  mapper("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  mapper("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>")
  mapper("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  mapper("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- mapper("n", "<leader>p", "<cmd>:Format<CR>")
  vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
    augroup END
  ]],
    true
  )
end

require "lspconfig".tsserver.setup {
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "json"
  },
  on_attach = function(client)
    my_attach(client)
    client.resolved_capabilities.document_formatting = false
  end
}

require "lspconfig".diagnosticls.setup {
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "json"},
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint",
      json = "eslint"
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "eslint_d",
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
    }
  }
}

local sumneko_install = "/home/nicky/apps/lua-language-server/"

require "lspconfig".sumneko_lua.setup {
  on_attach = my_attach,
  cmd = {sumneko_install .. "bin/Linux/lua-language-server", "-E", sumneko_install .. "main.lua"},
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}

require "lspconfig".dockerls.setup {on_attach = my_attach}
require "lspconfig".vimls.setup {on_attach = my_attach}
require "lspconfig".stylelint_lsp.setup {on_attach = my_attach}
require "lspconfig".cssls.setup {on_attach = my_attach}
require "lspconfig".jsonls.setup {on_attach = my_attach}
require "lspconfig".yamlls.setup {on_attach = my_attach}
-- require'lspconfig'.pyls.etup{on_attach=my_attach}

local prettierFmt = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
    stdin = true
  }
end

local eslintFmt = function()
  return {
    exe = "eslint_d",
    args = {"--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix-to-stdout"},
    stdin = true
  }
end

local stylelintFmt = function()
  return {
    exe = "stylelint",
    args = {"--stdin", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix"},
    stdin = true
  }
end

local yamlFmt = function()
  return {
    exe = "yamlfmt",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = false
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {eslintFmt},
      javascriptreact = {eslintFmt},
      json = {prettierFmt},
      scss = {stylelintFmt},
      css = {stylelintFmt},
      yaml = {yamlFmt},
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
  }
)

require "compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 2,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true
    -- vsnip = true;
  }
}
