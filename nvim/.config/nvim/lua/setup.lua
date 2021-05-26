local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local icons = {
  error = "🚫",
  warning = "🔥",
  info = "🪧",
  hint = "📣",
  ok = "🚀"
}

-- show current file in float
vim.defer_fn(
  function()
    vim.cmd([[
  autocmd BufEnter * lua require'showfilename'.show(2000)
  ]])
  end,
  50
)

-- https://github.com/glepnir/lspsaga.nvim
require "lspsaga".init_lsp_saga {
  border_style = "round",
  max_preview_lines = 15,
  error_sign = icons.error,
  warn_sign = icons.warning,
  hint_sign = icons.hint,
  infor_sign = icons.info,
  finder_action_keys = {
    open = "o",
    vsplit = "v",
    split = "s",
    quit = "<Esc>",
    scroll_down = "<C-d>",
    scroll_up = "<C-u>"
  },
  code_action_keys = {
    quit = "<Esc>",
    exec = "<CR>"
  },
  rename_action_keys = {
    quit = "<Esc>",
    exec = "<CR>"
  }
}

local lsp_status = require("lsp-status")
lsp_status.config(
  {
    indicator_errors = icons.error,
    indicator_warnings = icons.warning,
    indicator_info = icons.info,
    indicator_hint = icons.hint,
    indicator_ok = icons.ok,
    status_symbol = ""
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
    lualine_a = {
      {
        "mode",
        format = function(mode_name)
          return mode_name:sub(1, 1)
        end
      }
    },
    lualine_b = {"diff", "branch"},
    lualine_x = {"filetype"},
    lualine_y = {stat},
    lualine_z = {"progress"}
  },
  inactive_sections = {
    lualine_x = {"progress"}
  },
  options = {
    theme = "gruvbox_material",
    section_separators = "",
    component_separators = ""
  }
}

local my_attach = function(client)
  -- require "completion".on_attach(client)
  lsp_status.on_attach(client)
  mapper("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  -- mapper("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>")
  -- mapper("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- mapper("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- mapper("n", "<leader>p", "<cmd>:Format<CR>")
  vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.rs,*.lua,*.jsx,*.css,*.scss FormatWrite
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
    "typescript.tsx"
  },
  on_attach = function(client, bufnr)
    my_attach(client)
    client.resolved_capabilities.document_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup {
      disable_commands = false,
      enable_import_on_completion = true,
      import_on_completion_timeout = 5000,
      -- eslint
      eslint_bin = "eslint_d",
      eslint_args = {"-f", "json", "--cache", "--stdin", "--stdin-filename", "$FILENAME"},
      eslint_enable_disable_comments = true,
      -- experimental settings!
      -- eslint diagnostics
      eslint_enable_diagnostics = true,
      eslint_diagnostics_debounce = 250,
      -- formatting
      enable_formatting = false,
      formatter = "prettier",
      formatter_args = {"--stdin-filepath", "$FILENAME"},
      format_on_save = false,
      no_save_after_format = false
    }

    -- no default maps, so you may want to define some here
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TSLspRenameFile<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", ":TSLspImportAll<CR>", {silent = true})
  end
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
