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
    lualine_a = {
      {
        "mode",
        fmt = function(mode_name)
          return mode_name:sub(1, 1)
        end,
      },
    },
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
  -- require "completion".on_attach(client)
  lsp_status.on_attach(client)
  mapper("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ async = false })")
  end
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
        "typescript",
        "typescriptreact",
        "markdown",
        "json",
        "yaml",
      },
    }),
    null_ls.builtins.formatting.stylelint,
  },
})

require("lspconfig").tsserver.setup({
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false,
    }),
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup_client(client)
    my_attach(client)

    -- no default maps, so you may want to define some here
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TSLspRenameFile<CR>", { silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", ":TSLspImportAll<CR>", { silent = true })
  end,
})

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
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
  on_attach = function(client)
    my_attach(client)
  end,
  filetypes = { "css", "scss" },
})
require("lspconfig").cssls.setup({
  on_attach = my_attach,
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  debug = true,
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
