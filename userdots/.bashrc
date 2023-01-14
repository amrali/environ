# Set color terminal
export TERM=xterm-256color

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

# Source git prompt
source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# Perl stuff
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# My prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

export __RED_C="\[$(tput setaf 1)\]"
export __CYAN_C="\[$(tput setaf 6)\]"
export __GREEN_C="\[$(tput setaf 2)\]"
export __YELLOW_C="\[$(tput setaf 3)\]"
export __RESET_C="\[$(tput sgr0)\]"

unset __my_git
__my_git()
{
    local gitps1="$(__git_ps1 "(%s)")"
    if [ "x${gitps1}" != "x" ]; then
        printf %s "${gitps1} "
    fi
}
export -f __my_git

# Terminal title setter

unset set_title
set_title()
{
    echo -en "\033]0;$*\a"
}
export -f set_title

# Grep the result of `ps aux` for a string

unset psgrep
psgrep()
{
    ps aux | grep $* | grep -v grep
}
export -f psgrep

# Force color for ls type commands
export CLICOLOR=1

# Aliases
alias li='ls -liahp'
alias la='ls -AF'
alias l='ls -F'
alias g='hub'
alias gprune='git gc --prune=now; git remote prune origin'
alias glsmerged='git branch --merged | egrep -v "(^\*|master|production|staging|main)"'
alias grmmerged='git branch --merged | egrep -v "(^\*|master|production|staging|main)" | xargs git branch -d'
alias eo='exo-open'
alias vo='vim -O'
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

#notifyDone() {
#    terminal-notifier -title "Terminal" -message "$1. Exit status: $?" -activate com.apple.Terminal
#}

# Load secrets
if [ -r $HOME/.secrets ]; then
    source $HOME/.secrets
fi

# Set locale
export LANG=en_US.UTF-8
export LC_ALL=$LANG

# My prompt
export PS1="${__CYAN_C}\u::\h ${__GREEN_C}\W${__RESET_C} ${__YELLOW_C}\$(__my_git)${__RESET_C}${__RED_C}\$${__RESET_C} "

# Setup VirtualGo
command -v vg >/dev/null 2>&1 && eval "$(vg eval --shell bash)"

# Setup rbenv
eval "$(rbenv init -)"

# Load RVM as a function in a shell session
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load GVM as a function in a shell session
[[ -s "/home/d4de/.gvm/scripts/gvm" ]] && source "/home/d4de/.gvm/scripts/gvm"
. "$HOME/.cargo/env"
