export ZSH="/usr/share/oh-my-zsh"
ZSH_THEME="eastwood"

plugins=(
  vi-mode
)

# ░█▀█░█░░░▀█▀░█▀█░█▀▀
# ░█▀█░█░░░░█░░█▀█░▀▀█
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀
alias gs="git status"
alias gaa="git add . --all"
alias gc="git commit"
alias gk="gitk"
alias gg="lazygit"
alias gpp="git pull --rebase && git push"
alias gpl="git pull --rebase --autostash"
alias gps="git push"
alias gd="git log origin/dev ^origin/master"
alias core="cd ~/code/boards-core"
alias devops="cd ~/code/devops"
alias ncore="core && nvim"
alias ndevops="devops && nvim"
alias conf="cd ~/.config"
alias nconf="conf && nvim"
alias dots="cd ~/code/dotfiles"
alias ndots="dots && nvim"
alias x="startx"
alias yayu="yay -Syu --devel --timeupdate"
alias n="nvim"
alias :q="exit"
alias wk="cd ~/Documents/Notes/ && nvim"
alias dsa="docker start proxy redis mongo minio"
alias docker-rmq="docker ps -a -q -f status=exited | xargs docker rm"
alias fprox="cd ~/code/devops/local-utils/proxy && bash fprox.sh && cd -"
alias keys="~/.config/sxhkd/keys.sh"
alias nkeys="n ~/.config/sxhkd/sxhkdrc"
alias lspinstall="npm i -g @babel/cli @babel/core @babel/node concurrently dockerfile-language-server-nodejs eslint eslint_d neovim nodemon prettier stylelint stylelint-lsp tslib typescript typescript-language-server vim-language-server vscode-css-languageserver-bin vscode-json-languageserver cssmodules-language-server @tailwindcss/language-server vscode-langservers-extracted emmet-ls"
alias lspbuninstall="bun add --global @babel/cli @babel/core @babel/node concurrently dockerfile-language-server-nodejs eslint eslint_d neovim nodemon prettier stylelint stylelint-lsp tslib typescript typescript-language-server vim-language-server vscode-css-languageserver-bin vscode-json-languageserver cssmodules-language-server @tailwindcss/language-server vscode-langservers-extracted emmet-ls"
alias ssh="TERM=linux ssh"
alias shares="python ~/.config/bspwm/stocks.py"
alias yrd="yarn run dev:srv"
alias web="cd ~/code/boards-core/boards-webfront/"
alias yrs="web && yarn run start"
alias fact="curl --no-progress-meter https://uselessfacts.jsph.pl/api/v2/facts/random\?language\=en | jq .text"
alias pandoc='docker run --rm -v "`pwd`:/data" -v "/usr/share/fonts/TTF:/fonts" pandoc/latex'
alias gotop=vtop
alias ttq="curl http://api.quotable.io/random|jq '[.text=.content|.attribution=.author]'|tt -oneshot -quotes -"
alias ttd="tt -n 10 -oneshot -showwpm -w 10 -csv >> ~/wpm.csv"

# ░█▀▀░█▀█░█░█
# ░█▀▀░█░█░▀▄▀
# ░▀▀▀░▀░▀░░▀░
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

# ░█▀█░█▀█░█▀▄░█▀▀░░░░▀▀█░█▀▀
# ░█░█░█░█░█░█░█▀▀░░░░░░█░▀▀█
# ░▀░▀░▀▀▀░▀▀░░▀▀▀░▀░░▀▀░░▀▀▀
[ -f "$HOME/.npmrc" ] && rm ~/.npmrc
[ -s "/home/nicky/.bun/_bun" ] && source "/home/nicky/.bun/_bun"
hash npm 2>/dev/null && source <(npm completion)
# hash npm 2>/dev/null && npm config set prefix '~/.npm-global'
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
hash yarn 2>/dev/null && export PATH="$(yarn global bin):$PATH"

# ░█▀▀░█░█░█▀▀░░░█░█░█░█░█░█▀▄░█▀▀
# ░█░█░█▀▄░█▀▀░▄▀░░█▀▄░█░█░█▀▄░█▀▀
# ░▀▀▀░▀░▀░▀▀▀░▀░░░▀░▀░▀▀▀░▀▀░░▀▀▀
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
if [ -f '/home/nicky/apps/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/home/nicky/apps/gcloud/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/nicky/apps/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/nicky/apps/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
hash kubectl 2>/dev/null && source <(kubectl completion zsh)

# ░▀▀█░█▀▀░█░█
# ░▄▀░░▀▀█░█▀█
# ░▀▀▀░▀▀▀░▀░▀
source $ZSH/oh-my-zsh.sh

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

autoload -Uz compinit
compinit
autoload zmv

bindkey '\e.' insert-last-word

[[ -e ~/.config/antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.config/antidote
. ~/.config/antidote/antidote.zsh
antidote load

function subdir_do() {
  for d in ./*/ ; do (echo "=== $d ===" && cd "$d" && "$@") ; done
}

function zz() {
  cd $(z | awk '{print $2}' | fzf --scheme=path --tac)
}

function fzfz() {
  cd $(z | awk '{print $2}' | fzf --scheme=path --tac)
  zle reset-prompt
}

zle -N fzfz
bindkey '^g' fzfz

