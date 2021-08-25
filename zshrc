# Set variables
export HOMEBREW_CASK_OPTS="--no-quarantine"

# Change ZSH  optionsg

# Create aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias man='batman'

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