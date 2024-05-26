# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


  # ▜ ▘    
# ▀▌▐ ▌▀▌▛▘
# █▌▐▖▌█▌▄▌
         # 
alias gs="git status"
alias gaa="git add . --all"
alias gc="git commit"
alias gk="gitk"
alias gg="lazygit"
alias gpp="git pull --rebase && git push"
alias gpl="git pull --rebase --autostash"
alias gps="git push"
alias conf="cd ~/.config"
alias nconf="conf && nvim"
alias x="startx"
alias n="nvim"
alias :q="exit"
alias wk="cd ~/Documents/Notes/ && nvim"
alias docker-rmq="docker ps -a -q -f status=exited | xargs docker rm"
alias keys="~/.config/sxhkd/keys.sh"
alias nkeys="n ~/.config/sxhkd/sxhkdrc"
alias lspinstall="npm i -g @babel/cli @babel/core @babel/node concurrently dockerfile-language-server-nodejs eslint eslint_d neovim nodemon prettier stylelint stylelint-lsp tslib typescript typescript-language-server vim-language-server vscode-css-languageserver-bin vscode-json-languageserver cssmodules-language-server @tailwindcss/language-server vscode-langservers-extracted emmet-ls"
alias lspbuninstall="bun add --global @babel/cli @babel/core @babel/node concurrently dockerfile-language-server-nodejs eslint eslint_d neovim nodemon prettier stylelint stylelint-lsp tslib typescript typescript-language-server vim-language-server vscode-css-languageserver-bin vscode-json-languageserver cssmodules-language-server @tailwindcss/language-server vscode-langservers-extracted emmet-ls"
alias ssh="TERM=linux ssh"
alias ls='ls --color'
alias shares="python ~/.config/bspwm/stocks.py"
alias fact="curl --no-progress-meter https://uselessfacts.jsph.pl/api/v2/facts/random\?language\=en | jq .text"
alias pandoc='docker run --rm -v "`pwd`:/data" -v "/usr/share/fonts/TTF:/fonts" pandoc/latex'
alias top=bpytop
alias ttq="curl http://api.quotable.io/random|jq '[.text=.content|.attribution=.author]'|tt -oneshot -quotes -"
alias ttd="tt -n 10 -oneshot -showwpm -w 10 -csv >> ~/wpm.csv"

# █▌▛▌▌▌
# ▙▖▌▌▚▘
export APP_URI=https://dev-client.isw.net.au
export API_GATEWAY=https://dev-server.isw.net.au
export KUBECONFIG=/home/nicky/.config/kube/config
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox
export GOPATH=/home/nicky/go
export CARGO_PATH=/home/nicky/.cargo/bin
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_PATH=$ANDROID_SDK_ROOT/emulator
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:$GOPATH/bin:/home/nicky/bin:$ANDROID_PATH:$CARGO_PATH:/home/nicky/.local/bin:~/.npm-global/bin
export VISUAL=nvim
export EDITOR=nvim
export BAT_THEME=gruvbox-dark
export TERM_ITALICS=true
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
[[ -f ~/.env.sh ]] && source ~/.env.sh


     # ▌     ▘  
# ▛▌▛▌▛▌█▌   ▌▛▘
# ▌▌▙▌▙▌▙▖▗  ▌▄▌
          # ▙▌  
[ -f "$HOME/.npmrc" ] && rm ~/.npmrc
[ -s "/home/nicky/.bun/_bun" ] && source "/home/nicky/.bun/_bun"
# hash npm 2>/dev/null && source <(npm completion)
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
hash yarn 2>/dev/null && export PATH="$(yarn global bin):$PATH"


  # ▌      ▌  ▌   ▌   
# ▛▌▙▘█▌  ▐   ▙▘▌▌▛▌█▌
# ▙▌▛▖▙▖  ▞   ▛▖▙▌▙▌▙▖
# ▄▌      ▘           
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
if [ -f '/home/nicky/apps/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/home/nicky/apps/gcloud/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/nicky/apps/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/nicky/apps/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
hash kubectl 2>/dev/null && source <(kubectl completion zsh)

  # ▘  ▘▗ 
# ▀▌▌▛▌▌▜▘
# ▙▖▌▌▌▌▐▖
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::archlinux
zinit snippet OMZP::kubectl
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# ▄▖  ▗ ▄▖▌ 
# ▙▌  ▜ ▛▌▙▘
# ▌   ▟▖█▌▛▖
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ▌ ▘  ▗       
# ▛▌▌▛▘▜▘▛▌▛▘▌▌
# ▌▌▌▄▌▐▖▙▌▌ ▙▌
           # ▄▌
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

         # ▜   ▗ ▘    
# ▛▘▛▌▛▛▌▛▌▐ █▌▜▘▌▛▌▛▌
# ▙▖▙▌▌▌▌▙▌▐▖▙▖▐▖▌▙▌▌▌
       # ▌            
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


      # ▗      
# ▛▘▌▌▛▘▜▘▛▌▛▛▌
# ▙▖▙▌▄▌▐▖▙▌▌▌▌

setopt auto_cd
cdpath=($HOME/code $HOME/.config)

# alt+.
bindkey '\e.' insert-last-word

function subdir_do() {
  for d in ./*/ ; do (echo "=== $d ===" && cd "$d" && "$@") ; done
}

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

function fzfz() {
  cd $(z | awk '{print $2}' | fzf --scheme=path --tac)
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done
  zle reset-prompt
}

zle -N fzfz
bindkey '^g' fzfz

