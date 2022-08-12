# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="miloshadzic"
ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  vi-mode
)

alias gs="git status"
alias gaa="git add . --all"
alias gc="git commit"
alias gk="gitk"
alias gg="lazygit"
alias gpp="git pull --rebase && git push"
alias gpl="git pull --rebase --autostash"
alias gps="git push"
alias gd="git log origin/dev ^origin/master"
alias core="cd ~/code/kudos-boards-core"
alias devops="cd ~/code/devops"
alias ncore="core && nvim"
alias ndevops="devops && nvim"
alias conf="cd ~/.config"
alias nconf="conf && nvim"
alias x="startx"
alias yayu="yay -Syu --devel --timeupdate"
alias n="nvim"
alias :q="exit"
alias wk="cd ~/Documents/Notes/ && nvim"
alias ksa="core && docker start proxy redis mongodb minio && kudos dev all"
alias dsa="docker start proxy redis mongo minio"
alias fprox="cd ~/code/devops/local-utils/proxy && bash fprox.sh && cd -"
alias keys="~/.config/sxhkd/keys.sh"
alias nkeys="n ~/.config/sxhkd/sxhkdrc"
alias npmglobalinstall="yarn global add @babel/cli @babel/core @babel/node concurrently dockerfile-language-server-nodejs eslint eslint_d neovim nodemon prettier stylelint stylelint-lsp tslib typescript typescript-language-server vim-language-server vscode-css-languageserver-bin vscode-json-languageserver yaml-language-server cssmodules-language-server"
alias lspinstall="yarn global add @babel/cli @babel/core @babel/node concurrently dockerfile-language-server-nodejs eslint eslint_d neovim nodemon prettier stylelint stylelint-lsp tslib typescript typescript-language-server vim-language-server vscode-css-languageserver-bin vscode-json-languageserver yaml-language-server cssmodules-language-server"
alias ssh="TERM=linux ssh"
alias shares="~/apps/ticker.sh/ticker.sh A200.AX VISM.AX"
alias yrd="yarn run dev:srv"
alias web="cd ~/code/kudos-boards-core/kudos-boards-webfront/"
alias yrs="web && yarn run start"
alias fact="curl --no-progress-meter https://uselessfacts.jsph.pl/random.txt\?language\=en | head -n 1"
alias pandoc='docker run --rm -v "`pwd`:/data" -v "/usr/share/fonts/TTF:/fonts" pandoc/latex'

export APP_URI=https://dev-client.isw.net.au
export API_GATEWAY=https://dev-server.isw.net.au
export KUBECONFIG=/home/nicky/.config/kube/config
export CHROME_DEVEL_SANDBOX=/usr/local/sbin/chrome-devel-sandbox
export GOPATH=/home/nicky/go
export CARGO_PATH=/home/nicky/.cargo/bin
export ANDROID_SDK_ROOT=/opt/android-sdk
export ANDROID_PATH=$ANDROID_SDK_ROOT/emulator
export _JAVA_AWT_WM_NONREPARENTING=1
export PATH=$PATH:$GOPATH/bin:/home/nicky/bin:$ANDROID_PATH:$CARGO_PATH:/home/nicky/.local/bin
export VISUAL=nvim
export EDITOR=nvim
export BAT_THEME=gruvbox-dark
export TERM_ITALICS=true

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# upgrading node directly recreates this file
[ -f ~/.npmrc ] && rm ~/.npmrc

source $ZSH/oh-my-zsh.sh

source /usr/share/nvm/init-nvm.sh
export PATH="$(yarn global bin):$PATH"

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
source /opt/google-cloud-sdk/completion.zsh.inc
source /opt/google-cloud-sdk/path.zsh.inc
source <(kubectl completion zsh)

autoload -Uz compinit
compinit

bindkey '\e.' insert-last-word

# clone antidote if necessary
[[ -e ~/.antidote ]] || git clone https://github.com/mattmc3/antidote.git ~/.antidote
# source antidote
. ~/.antidote/antidote.zsh
# generate and source plugins from ~/.zsh_plugins.txt
antidote load
