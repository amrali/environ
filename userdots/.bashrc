
# Aliases
alias li='ls -liah'
alias la='ls -AF'
alias l='ls -F'
alias eo='exo-open'
alias vo='vim -O'
alias sel='xsel -bi'

# My prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1

__RED_C=$(tput setaf 1)
__CYAN_C=$(tput setaf 6)
__GREEN_C=$(tput setaf 2)
__YELLOW_C=$(tput setaf 3)
__RESET_C=$(tput sgr0)

function __my_prompt()
{
    local gitps1="$(__git_ps1 "(%s)")"
    local fpart="${__CYAN_C}$1::$2 ${__GREEN_C}$3${__RESET_C}"
    local gitpart="${__YELLOW_C}${gitps1}${__RESET_C}"
    local lpart="${__RED_C}\$${__RESET_C} "
    if [ "x${gitps1}" != "x" ]; then
        printf %s "${fpart} ${gitpart} ${lpart}"
    else
        printf %s "${fpart} ${lpart}"
    fi
}

export PS1="\[\$(__my_prompt \u \h \W)\]"

# Terminal title setter

function set_title()
{
    echo -en "\033]0;$*\a"
}

# Add GOPATH
export GOPATH=$HOME/bits/go

# Update PATH with custom paths
export PATH=$GOPATH/bin:$PATH

