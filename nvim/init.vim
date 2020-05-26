call plug#begin('~/.local/share/nvim/plugged')

" File nav
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'mbbill/undotree'

" Pretties
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'

" Editor convenience
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'junegunn/vim-peekaboo'

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
Plug 'scrooloose/nerdcommenter'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Syntax
Plug 'mitsuhiko/vim-jinja'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'stephpy/vim-yaml'
Plug 'vim-scripts/groovy.vim'

" new plugins go here until confirmed useful...
Plug 'justinmk/vim-sneak'
Plug 'jremmen/vim-ripgrep'

call plug#end()
au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy

filetype plugin on

set rtp+=~/.fzf
set laststatus=2
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set backupcopy=yes
set number
set cursorline
set termguicolors
set background=dark
set completeopt+=noinsert
set guifont=Hasklig\ 10
set noshowmode
set conceallevel=0
set relativenumber
set ignorecase
set hidden
set undofile
set undolevels=1000
set shada="NONE"
set clipboard=unnamed
set title titlestring=%t\ %y\ %m
set scrolloff=10
set tags+=.git/tags
colorscheme solarized8

hi Normal guibg=NONE ctermbg=NONE

let g:prosession_dir = '~/.config/nvim/session/'

let g:clap_insert_mode_only = v:true
" let g:clap_theme = 'material_design_dark'
let g:clap_layout = { 'relative': 'editor' }
let g:clap_provider_grep_executable = 'ag'

let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.html.erb,*.md'

let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1
au VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=none
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#193F49

let mapleader = ' '

let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

let g:startify_session_persistence = 1
let g:startify_session_autoload = 1

let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

let NERDTreeQuitOnOpen = 1
" let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'  ]  ]
      \
      \},
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \},
      \'separator': { 'left': "", 'right': "" },
      \'subseparator': { 'left': "", 'right': "" }
      \}

let g:lightline.active.right = [
      \ ['lineinfo'],
      \ ['percent'],
      \ ['cocstatus'],
      \ ]

let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='h'


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
let $FZF_DEFAULT_OPTS='--layout=reverse --border'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  let height = float2nr(&lines * 0.9)
  let width = float2nr(&columns * 0.6)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }
  call nvim_open_win(buf, v:true, opts)
endfunction

let g:move_key_modifier = 'S'

nnoremap <leader>ct :!ctags -Rf .git/tags --tag-relative --extra=+f --exclude=.git --exclude=node_modules<cr><cr>

nnoremap <Leader>. '.

" COC ((
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
inoremap <expr><up> pumvisible() ? "\<C-p>" : "\<up>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> <Leader>n <Plug>(coc-diagnostic-next)
nnoremap <Leader>d :<C-u>CocList diagnostics<cr>
nnoremap <Leader>p :<C-u>CocCommand prettier.formatFile<cr>
nnoremap <Leader>cr :CocRestart<cr>

inoremap jk <Esc>
inoremap kj <Esc>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Use <c-k> to show documentation in preview window.
nnoremap <silent> <c-k> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nnoremap <leader>ac  :CocAction<cr>
" Fix autofix problem of current line
nnoremap <leader>qf  :CocFix<cr>
" end COC ))

nnoremap <silent> gt g<c-]>
" Fugitive
nnoremap <silent> <Leader>gs :G<cr>
nnoremap <silent> <Leader>gd :Gvdiffsplit<cr>
nnoremap <silent> <Leader>gl :Glog<cr>
nnoremap <silent> <Leader>gf :echo "...fetching"<cr> :Gfetch<cr> :echo<cr>
nnoremap <silent> <Leader>gr :echo "...rebasing"<cr> :Grebase<cr> :echo<cr>
nnoremap <silent> <Leader>gp :echo "...pushing"<cr> :Gpush<cr> :echo<cr>
nnoremap <silent> <Leader>gb :Gblame<cr>
nnoremap <Leader>gh :Gbrowse<cr>

nnoremap <Leader>uh :UndotreeShow<cr>:UndotreeFocus<cr>
autocmd BufWinLeave NERD_tree_* NERDTreeClose

tnoremap <silent> <A-h> <C-\><C-n><C-w>h
tnoremap <silent> <A-j> <C-\><C-n><C-w>j
tnoremap <silent> <A-k> <C-\><C-n><C-w>k
tnoremap <silent> <A-l> <C-\><C-n><C-w>l
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l

nnoremap <C-_> :call NERDComment(0,"toggle")<cr>
nnoremap <C-/> :call NERDComment(0,"toggle")<cr>

" terminal
nnoremap <leader>t :call OpenTerminal()<cr>
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

nnoremap & #*
nmap <esc><esc> :noh<CR>

" remap prev and next
nnoremap <A-b> <C-o>
nnoremap <A-B> <C-i>

map <C-o> :NERDTreeToggle<CR>
map <leader>o :NERDTreeFind<CR>

nnoremap <C-p> :Clap files<CR>
nnoremap <C-i> :Clap buffers<CR>
nnoremap <C-y> :Clap yanks<CR>
nnoremap <C-h> :Clap jumps<CR>
nnoremap <Leader>f :Clap grep<CR>
nnoremap <Leader>F :Clap grep ++query=<cword><CR>
vnoremap <Leader>F :Clap grep ++query=@visual<CR>

nnoremap <Leader>j J

" quickfix
nnoremap <Leader>qf :Rg 
nnoremap <Leader>qn :cn<CR>
nnoremap <Leader>qb :cp<CR>
nnoremap <Leader>qc :cclo<CR>
nnoremap <Leader>qq :Clap quickfix<CR>

nnoremap <silent><C-s> <Esc>:w<CR>
inoremap <silent><C-s> <Esc>:w<CR>
nnoremap <Leader>w :w<CR>

nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

nnoremap <A-o> o<Esc>
nnoremap <A-O> O<Esc>
nnoremap <Del> "_x

nnoremap <leader><leader> :b#<cr>


