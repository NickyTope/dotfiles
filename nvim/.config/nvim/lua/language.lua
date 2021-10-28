local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local icons = {
  error = "🚫",
  warning = "🔥",
  info = "🪧",
  hint = "📣",
  ok = "🚀",
  action = "💡"
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

-- disable until fixed https://github.com/glepnir/lspsaga.nvim/issues/241
-- https://github.com/glepnir/lspsaga.nvim
-- require "lspsaga".init_lsp_saga {
--   border_style = "round",
--   max_preview_lines = 15,
--   error_sign = icons.error,
--   warn_sign = icons.warning,
--   hint_sign = icons.hint,
--   infor_sign = icons.info,
--   code_action_icon = icons.action,
--   code_action_prompt = {
--     enable = false,
--     virtual_text = false
--   },
--   finder_action_keys = {
--     open = "o",
--     vsplit = "v",
--     split = "s",
--     quit = "<Esc>",
--     scroll_down = "<C-d>",
--     scroll_up = "<C-u>"
--   },
--   code_action_keys = {
--     quit = "<Esc>",
--     exec = "<CR>"
--   },
--   rename_action_keys = {
--     quit = "<Esc>",
--     exec = "<CR>"
--   }
-- }

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
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false
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
    theme = "gruvbox"
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
    autocmd BufWritePost *.js,*.ts,*.rs,*.lua,*.jsx,*.css,*.scss FormatWrite
    augroup END
  ]],
    true
  )
end

-- require("null-ls").config { cmd = {"/usr/local/bin/nvim"} }
-- require("lspconfig")["null-ls"].setup {}

require("null-ls").config(
  {
    sources = {require("null-ls").builtins.formatting.stylua}
  }
)
require("lspconfig")["null-ls"].setup(
  {
    on_attach = my_attach
  }
)

require "lspconfig".tsserver.setup {
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false
    local ts_utils = require("nvim-lsp-ts-utils")

    ts_utils.setup {
      eslint_bin = "eslint_d",
      eslint_args = {"-f", "json", "--cache", "--stdin", "--stdin-filename", "$FILENAME"},
      eslint_enable_diagnostics = true
    }

    ts_utils.setup_client(client)
    my_attach(client)

    -- no default maps, so you may want to define some here
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TSLspRenameFile<CR>", {silent = true})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", ":TSLspImportAll<CR>", {silent = true})
  end
}

local sumneko_install = "/home/nicky/apps/lua-language-server/"

require "lspconfig".sumneko_lua.setup {
  on_attach = my_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
require "lspconfig".cssls.setup(
  {
    on_attach = my_attach,
    capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    debug = true,
    cmd = {"css-languageserver", "--stdio"}
  }
)
require "lspconfig".jsonls.setup(
  {
    on_attach = my_attach,
    cmd = {"vscode-json-languageserver", "--stdio"}
  }
)
require "lspconfig".yamlls.setup {on_attach = my_attach}

-- pip install 'python-lsp-server[all]'
require "lspconfig".pylsp.setup {on_attach = my_attach}

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
    args = {"--stdin", "--cache", "--stdin-filename", vim.api.nvim_buf_get_name(0), "--fix-to-stdout"},
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

local pythonFmt = function()
  return {
    exe = "autopep8",
    args = {"--in-place", vim.api.nvim_buf_get_name(0)},
    stdin = false
  }
end

require("formatter").setup(
  {
    logging = false,
    filetype = {
      javascript = {eslintFmt},
      javascriptreact = {eslintFmt},
      typescript = {eslintFmt},
      markdown = {prettierFmt},
      json = {prettierFmt},
      scss = {stylelintFmt},
      css = {stylelintFmt},
      yaml = {yamlFmt},
      python = {pythonFmt},
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

local cmp = require "cmp"
cmp.setup {
  sources = {
    {name = "nvim_lua"},
    {name = "nvim_lsp"},
    {name = "path", max_item_count = 3},
    {name = "vsnip"},
    {
      name = "buffer",
      keyword_length = 4,
      get_bufnrs = function()
        local bufs = {}
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          bufs[vim.api.nvim_win_get_buf(win)] = true
        end
        return vim.tbl_keys(bufs)
      end
    }
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  experimental = {
    native_menu = false,
    ghost_text = true
  },
  mapping = {
    ["<C-Space"] = cmp.mapping.complete(),
    -- tab ?
    ["<Enter>"] = cmp.mapping.confirm(
      {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }
    )
  }
}
