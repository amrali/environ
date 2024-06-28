eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:$(/opt/homebrew/bin/brew --prefix)/opt/python/libexec/bin

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
