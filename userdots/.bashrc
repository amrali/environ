
# Aliases
alias li='ls -liah'
alias la='ls -AF'
alias l='ls -F'
alias g='git'
alias eo='exo-open'
alias vo='vim -O'
alias sel='xsel -bi'
alias vactive='. venv/bin/activate'
alias vavlc='VDPAU_DRIVER=va_gl vlc'

# My prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

__RED_C="\[$(tput setaf 1)\]"
__CYAN_C="\[$(tput setaf 6)\]"
__GREEN_C="\[$(tput setaf 2)\]"
__YELLOW_C="\[$(tput setaf 3)\]"
__RESET_C="\[$(tput sgr0)\]"

function __my_git()
{
    local gitps1="$(__git_ps1 "(%s)")"
    if [ "x${gitps1}" != "x" ]; then
        printf %s "${gitps1} "
    fi
}

export PS1="${__CYAN_C}\u::\h ${__GREEN_C}\W${__RESET_C} ${__YELLOW_C}\$(__my_git)${__RESET_C}${__RED_C}\$${__RESET_C} "

# Terminal title setter

function set_title()
{
    echo -en "\033]0;$*\a"
}

# Set color terminal
export TERM=xterm-256color

# Add GOPATH
export GOPATH=$HOME/bits/go

# Add JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/default-java

# ADT paths
ADTPATH=/data/linux/pkgs/adt-bundle/sdk/platform-tools:/data/linux/pkgs/adt-bundle/sdk/tools

# Update PATH with custom paths
export PATH=$GOPATH/bin:$ADTPATH:$PATH

### Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH
