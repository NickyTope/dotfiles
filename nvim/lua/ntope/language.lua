local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

local icons = require("ntope.icons")

local lsp_status = require("lsp-status")
lsp_status.config({
  indicator_errors = icons.error,
  indicator_warnings = icons.warning,
  indicator_info = icons.info,
  indicator_hint = icons.hint,
  indicator_ok = icons.ok,
  status_symbol = "",
})
lsp_status.register_progress()
local function stat()
  return lsp_status.status()
end

local actions = require("telescope.actions")
require("telescope").setup({
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
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
  },
})
require("telescope").load_extension("ui-select")

require("lualine").setup({
  sections = {
    lualine_b = { "diff", "branch" },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_y = { stat },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_x = { "progress" },
  },
  options = {
    theme = "nightfox",
    -- globalstatus = true,
  },
})

local my_attach = function(client)
  lsp_status.on_attach(client)
  mapper("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  mapper("n", "td", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local null_ls = require("null-ls")
null_ls.setup({
  on_attach = my_attach,
  sources = {
    -- cargo install stylua
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.diagnostics.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.code_actions.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "markdown",
        "json",
        "yaml",
        "typescriptreact",
      },
    }),
    null_ls.builtins.formatting.stylelint,
    -- TODO
    -- null_ls.builtins.formatting.npm_groovy_lint,
  },
})

require("lspconfig").groovyls.setup({
  cmd = { "docker", "run", "--rm", "-ia", "stdin", "-ia", "stderr", "-ia", "stdout", "glsp" },
})

require("lspconfig").tsserver.setup({ on_attach = my_attach })
-- require("lspconfig").tsserver.setup({
--   handlers = {
--     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--       virtual_text = false,
--     })
--   },
--   on_attach = my_attach })

require("lspconfig").cssmodules_ls.setup({
  -- provide your on_attach to bind keymappings
  on_attach = my_attach,
  -- optionally
  init_options = {
    camelCase = "dashes",
  },
})

-- local sumneko_install = "/home/nicky/apps/lua-language-server/"
require("lspconfig").sumneko_lua.setup({
  on_attach = my_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

require("lspconfig").dockerls.setup({ on_attach = my_attach })
require("lspconfig").vimls.setup({ on_attach = my_attach })
require("lspconfig").stylelint_lsp.setup({
  filetypes = { "css", "scss" },
})

require("lspconfig").tailwindcss.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").cssls.setup({
  capabilities = capabilities,
  cmd = { "css-languageserver", "--stdio" },
})

require("lspconfig").jsonls.setup({
  on_attach = my_attach,
  cmd = { "vscode-json-languageserver", "--stdio" },
})

require("lspconfig").yamlls.setup({ on_attach = my_attach })
require("lspconfig").gopls.setup({
  on_attach = function(client)
    my_attach(client)
  end,
})

-- pip install 'python-lsp-server[all]'
require("lspconfig").pylsp.setup({
  on_attach = function(client)
    my_attach(client)
  end,
})

local config = vim.diagnostic.config()
config.underline = true
-- config.virtual_text = false
config.virtual_text = {
  -- spacing = 2,
  -- prefix = "<",
  severity = {
    min = vim.diagnostic.severity.INFO,
  },
}
vim.diagnostic.config(config)
