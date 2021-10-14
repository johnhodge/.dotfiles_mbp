# Set variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat

# Change ZSH  options

# Create aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias man='batman'
alias bbd='brew bundle dump --force --describe'
alias trail='<<<${(F)path}'

# Customize prompt(s)
PROMPT='
%1~ %L  %# '

RPROMPT='%*'

# Add locations to $PATH variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Write handy functions
function mkcd() {
mkdir -p "$@" && cd "$_";
}

# Use ZSH plugins
# ...and other surprises
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
