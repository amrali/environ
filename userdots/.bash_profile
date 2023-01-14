export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


gam() { "$HOME/bin/gam/gam" "$@" ; }
. "$HOME/.cargo/env"

export PATH="/Users/amr/.local/share/solana/install/active_release/bin:$PATH"
