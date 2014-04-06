
# Set color terminal
export TERM=xterm-256color

# Add GOPATH
export GOPATH="$HOME/bits/go"

# Add JAVA_HOME
export JAVA_HOME="/usr/lib/jvm/default-java"

# ADT paths
ADTPATH="/data/linux/pkgs/adt-bundle/sdk/platform-tools:/data/linux/pkgs/adt-bundle/sdk/tools"

# rbenv path
RBENVPATH="$HOME/.rbenv/bin"

# Heroku Toolbelt
HEROKUTOOLPATH="/usr/local/heroku/bin"

# Update PATH with custom paths
export PATH=$GOPATH/bin:$ADTPATH:$RBENVPATH:$HEROKUTOOLPATH:$PATH

# My prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

export __RED_C="\[$(tput setaf 1)\]"
export __CYAN_C="\[$(tput setaf 6)\]"
export __GREEN_C="\[$(tput setaf 2)\]"
export __YELLOW_C="\[$(tput setaf 3)\]"
export __RESET_C="\[$(tput sgr0)\]"

__my_git()
{
    local gitps1="$(__git_ps1 "(%s)")"
    if [ "x${gitps1}" != "x" ]; then
        printf %s "${gitps1} "
    fi
}
export -f __my_git

# Terminal title setter

set_title()
{
    echo -en "\033]0;$*\a"
}
export -f set_title

# Load .profile if it exists
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"

else
    # include .bashrc if it exists
    if [ -e "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi

    if [ -d "$HOME/bin" ]; then
        PATH="$HOME/bin:$PATH"
    fi
fi

