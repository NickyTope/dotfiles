call plug#begin('~/.local/share/nvim/plugged')

" File nav
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'

Plug 'mbbill/undotree'
Plug 'tpope/vim-eunuch'

" Pretties
" Plug 'lifepillar/vim-solarized8'
Plug 'arcticicestudio/nord-vim'
" Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'gruvbox-community/gruvbox'
Plug 'morhetz/gruvbox'

" Editor convenience
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-commentary'
Plug 'machakann/vim-highlightedyank'

" Text manilpulation
Plug 'tpope/vim-repeat'
Plug 'kana/vim-textobj-user'
Plug 'etdev/vim-textobject-pack'
Plug 'matze/vim-move'

" Input trickery
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'NickyTope/yanks.nvim'

" completion
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm i'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Syntax
Plug 'mitsuhiko/vim-jinja'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'iamcco/markdown-preview.vim'
Plug 'stephpy/vim-yaml'
Plug 'vim-scripts/groovy.vim'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/goyo.vim'
Plug 'plasticboy/vim-markdown'
" required by vim-markdown
Plug 'godlygeek/tabular'

" tools
Plug 'diepm/vim-rest-console'
Plug 'vimwiki/vimwiki'

" new plugins go here until confirmed useful...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhartington/formatter.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'glepnir/lspsaga.nvim'

call plug#end()
au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy

filetype plugin on

set laststatus=2
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set backupcopy=yes
set number
set relativenumber
set cursorline
set termguicolors
set background=dark
set completeopt=menuone,noselect
set noshowmode
set conceallevel=0
set smartcase
set ignorecase
set hidden
set undofile
set undolevels=1000
set title
set titlestring=%{expand(\"%:p:.\")}\ %y\ %m
set titlelen=120
set scrolloff=10
set tags+=.git/tags
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m
set noswapfile
set signcolumn=yes

colorscheme gruvbox

" transparency
hi Normal guibg=NONE ctermbg=NONE

let mapleader = ' '
" I keep pressing this and it freezes the terminal, remap to avoid...
inoremap <F6> h


function! FilenameForLightline()
    " return expand("%:p:.")
    return expand("%:t")
endfunction

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" ~/.config/nvim/lua/setup.lua
lua require'setup'

" ./plugin/yanks.vim
nmap <c-y> <Plug>(Yanks)

" ./plugin/gitfiles.vim
" nmap <c-p> <Plug>(gitfiles)

" ./plugin/buffers.vim
" nmap <c-i> <Plug>(buffers)

" highlighted yank
let g:highlightedyank_highlight_duration = 500

" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-dirvish
if !exists("dirvish_setup")
  au FileType dirvish call CustomDirvishSetup()
  let dirvish_setup = 1
  hi link DirvishTitle Search
endif

function! CustomDirvishSetup()
  let parts = split(expand("%:.:h"), "/")
  let preparts = []
  if len(parts) > 3
    call add(preparts, "(")
    for part in parts[0:-4]
      call add(preparts, part[0])
    endfor
    call add(preparts, ") ")
    let parts = parts[-3:]
  endif
  let path = join(preparts, "").join(parts, " > ")
  if path == "."
    let path = "(".expand("%:h:t").")"
  endif
  call append(0, "]   ".path."   [")
  syn match DirvishTitle =^].*$=
  setlocal conceallevel=2
  map <buffer> ma :e %
  map <buffer> mf :Mkdir %
  map <buffer> mc Y:!cp " "
  map <buffer> mm Y:!mv " "
  map <buffer> md Y:!rm "
  map <buffer> <c-v> :call dirvish#open("vsplit", 0)<cr>
  map <buffer> <c-p> <cmd>lua require'telescope.builtin'.find_files{search_dirs={vim.fn.expand('%')}}<cr>
endfunction

let g:dirvish_git_indicators = {
\ 'Modified'  : '✹',
\ 'Staged'    : '✚',
\ 'Untracked' : '✭',
\ 'Renamed'   : '➜',
\ 'Unmerged'  : '═',
\ 'Ignored'   : '☒',
\ 'Unknown'   : '?'
\ }

" vimwiki uses - to decrease header level
au BufEnter *.md nmap <buffer> - <Plug>(dirvish_up)

" nmap <C-o> :vsp<cr>-
nnoremap <leader>o :e .<cr>
nnoremap _ :vsp <c-r>=expand("%:.:h")<cr><cr>
nnoremap <leader>e :e<cr>

" vimwiki
" only use vimwiki for .wiki files
let g:vimwiki_folding = 'list'
let g:vimwiki_ext2syntax = {'.wiki': 'media'}

" prosession
let g:prosession_dir = '~/.config/nvim/session/'

" closetag (auto close xml tags)
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.html.erb,*.md'

" indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd guibg=none
hi IndentGuidesEven guibg=#3C3836


" ulti snips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" commentary
map <C-_> :Commentary<cr>
map <C-/> :Commentary<cr>

" vim-rest-console
let g:vrc_curl_opts = {
  \ '--connect-timeout' : 5,
  \ '-s': '',
  \ '-i': '',
  \ '--max-time': 20,
  \ '--ipv4': '',
  \ '-k': '',
\}

" goyo
nnoremap <Leader>gy :Goyo<cr>
function! s:goyo_enter()
  set spell
  set linebreak
endfunction

function! s:goyo_leave()
  set nospell
  set nolinebreak
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" nnoremap <Leader>e :!eslint % --fix --cache<cr>
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <Tab> pumvisible() ? compe#confirm('<CR>') : "<Tab>"
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" nnoremap <Leader>n :lua vim.lsp.diagnostic.goto_next()<cr>
nnoremap <Leader>N :Lspsaga diagnostic_jump_prev<CR>
nnoremap <Leader>n :Lspsaga diagnostic_jump_next<CR>
nnoremap <Leader>ca :Lspsaga code_action<CR>
nnoremap <Leader>rn :Lspsaga rename<CR>
nnoremap <Leader>k :Lspsaga hover_doc<CR>
nnoremap <Leader>K :Lspsaga signature_help<CR>
nnoremap <Leader>gd :Lspsaga lsp_finder<CR>

nnoremap <Leader>p <cmd>Format<cr>
" nnoremap <leader>F <cmd>grep <c-r>=expand("<cword>")<cr> *<cr>

" my remaps {{
" nnoremap <A-b> <C-o>
" nnoremap <A-B> <C-i>

nnoremap <Leader>j J
nnoremap Q :q<cr>
nnoremap <Leader>k K
nnoremap <Leader>. '.
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <silent> gt g<c-]>
nmap <Leader><Esc> :noh<CR>

" quickfix
nnoremap <Leader>qn :cn<CR>
nnoremap <Leader>qb :cp<CR>
nnoremap <Leader>qc :cclo<CR>
nnoremap <Leader>qo :copen<CR>

nnoremap <silent><C-s> <Esc>:w<CR>
inoremap <silent><C-s> <Esc>:w<CR>
nnoremap <Leader>w :w <c-r>%

nnoremap <A-o> o<Esc>
nnoremap <A-O> O<Esc>

nnoremap <Del> "_x
nnoremap x "_x

" don't add {} moves to jumplist
nnoremap } :keepjumps normal! }<cr>
nnoremap { :keepjumps normal! {<cr>

nnoremap <leader><leader> :b#<cr>
" }}

" vim-move
let g:move_key_modifier = 'S'


" telescope
" https://github.com/nvim-telescope/telescope.nvim#pickers
" nnoremap <c-p> <cmd>Telescope git_files<cr>
nnoremap <c-p> <cmd>lua require'telescope.builtin'.git_files{cwd=vim.fn.expand('%:h')}<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>F <cmd>Telescope grep_string<cr>
nnoremap <leader>t <cmd>Telescope treesitter<cr>
nnoremap <leader>b <cmd>lua require'telescope.builtin'.buffers{show_all_buffers=false}<cr>
nnoremap <leader>i <cmd>lua require'telescope.builtin'.buffers{show_all_buffers=true}<cr>
nnoremap <leader>qq <cmd>Telescope quickfix<cr>
nnoremap <Leader>d <cmd>Telescope lsp_document_diagnostics<cr>

" Fugitive
nnoremap <silent> <Leader>gs :G<cr>
" nnoremap <silent> <Leader>gd :Git log origin/master..dev<cr>
nnoremap <silent> <Leader>gl :Glog<cr>
nnoremap <silent> <Leader>gf :Git fetch<cr>
nnoremap <silent> <Leader>gr :Git rebase<cr>
nnoremap <silent> <Leader>gp :Git push<cr>
nnoremap <silent> <Leader>gb :Git blame<cr>
nnoremap <Leader>gh :GBrowse<cr>

" undo tree
nnoremap <Leader>uh :UndotreeShow<cr>:UndotreeFocus<cr>

" window movement
tnoremap <silent> <A-h> <C-\><C-n><C-w>h
tnoremap <silent> <A-j> <C-\><C-n><C-w>j
tnoremap <silent> <A-k> <C-\><C-n><C-w>k
tnoremap <silent> <A-l> <C-\><C-n><C-w>l
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l

" terminal
nnoremap <leader>T :call OpenTerminal()<cr>
" map escape to go to normal mode in terminal buffers,
" don't do this in a tnoremap becasue it conflicts with fzf Esc to close
au BufEnter * if &buftype == 'terminal' | :tmap <buffer> <Esc> <C-\><C-n> | endif
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

" Sytem clipboard
vmap <C-c> "+y
vmap cp "+y
nmap <leader>v "+p
