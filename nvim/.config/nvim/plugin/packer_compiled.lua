-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nicky/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nicky/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nicky/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nicky/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nicky/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/cmp-vsnip"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/csv.vim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["groovy.vim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/groovy.vim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["markdown-preview.vim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/markdown-preview.vim"
  },
  ["nginx.vim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/nginx.vim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/tabular"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-css-color"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-css-color"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-dirvish-git"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-dirvish-git"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-indent-guides"
  },
  ["vim-jinja"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-jinja"
  },
  ["vim-js"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-js"
  },
  ["vim-jsx-improve"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-jsx-improve"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-prosession"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-prosession"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rest-console"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-rest-console"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-textobject-pack"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-textobject-pack"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-yaml"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vim-yaml"
  },
  vimwiki = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["yanks.nvim"] = {
    loaded = true,
    path = "/home/nicky/.local/share/nvim/site/pack/packer/start/yanks.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
