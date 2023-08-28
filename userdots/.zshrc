# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git rust zsh-autosuggestions docker command-not-found aws)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Personal plugins
source $ZSH/plugins/zaw/zaw.zsh

# CTRL-R will pull up zaw-history (backwards zsh history search)
bindkey '^r' zaw-history
# CTRL-B will pull up zaw-git-branches which will search your current git branches and switch (git checkout) to the branch you select when you hit enter.
bindkey '^b' zaw-git-branches

# Add GOPATH
export GOPATH="$HOME/bits/go"

# RVM path
RVMPATH="$HOME/.rvm/bin"

# rbenv path
RBENVPATH="$HOME/.rbenv/bin"

# Cargo path
CARGOPATH="$HOME/.cargo/bin"

# Personal scripts
PERSONALPATH="$HOME/bin"

# Homebrew sbin path
BREW_SBIN_PATH="/usr/local/sbin"

# Android Studio paths
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Update PATH with custom paths
export PATH=$PATH:$PERSONALPATH:$CARGOPATH:$GOPATH/bin:$RVMPATH:$RBENVPATH:$BREW_SBIN_PATH

# Export credentials
export `cat ~/.cloudflare/credentials`
export `cat ~/.azure/credentials`
export `cat ~/.datadog/credentials`

# Aliases
alias li='ls -liahp'
alias la='ls -AF'
alias l='ls -F'
alias g='hub'
alias gprune='git gc --prune=now; git remote prune origin'
alias glsmerged='git branch --merged | egrep -v "(^\*|master|production|staging|main)"'
alias grmmerged='git branch --merged | egrep -v "(^\*|master|production|staging|main)" | xargs git branch -d'
alias eo='exo-open'
alias vo='nvim -O'
alias sel='xsel -bi'
alias vactive='. venv/bin/activate'
alias vavlc='VDPAU_DRIVER=va_gl vlc'
alias dcom='docker compose'
alias enter-hyperkit='screen ~/Library/Containers/com.docker.docker/Data/vms/0/tty'
alias vbox='VBoxManage'
alias terra='terraform'
alias jc-ls='aws-jumpcloud list'
alias jc-rotate='aws-jumpcloud rotate'
alias docker-clean="docker ps -a | awk '{print$1}' | sed -n '1d;p' | xargs docker rm"

# Functions

# Terminal title setter
set_title()
{
    echo -en "\033]0;$*\a"
}

# Grep the result of `ps aux` for a string
psgrep()
{
    ps aux | grep $* | grep -v grep
}

jc-export() {
    eval `aws-jumpcloud export "$1"`
}

jc-apply() {
    jc-rotate "$1"; jc-export "$1"
}

store-secret() {
    security add-generic-password -U -a $LOGNAME -s "$1" -w "$2"
}

load-secret() {
    security find-generic-password -w -a $LOGNAME -s "$1"
}

# Setup VirtualGo
command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell bash)"

# Setup rbenv
eval "$(rbenv init -)"

# Load RVM as a function in a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load GVM as a function in a shell session
[[ -s "/home/d4de/.gvm/scripts/gvm" ]] && source "/home/d4de/.gvm/scripts/gvm"
. "$HOME/.cargo/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

