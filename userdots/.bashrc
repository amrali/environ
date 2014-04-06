
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
export PS1="${__CYAN_C}\u::\h ${__GREEN_C}\W${__RESET_C} ${__YELLOW_C}\$(__my_git)${__RESET_C}${__RED_C}\$${__RESET_C} "

# Setup rbenv
eval "$(rbenv init -)"

