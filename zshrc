echo 'hello world from .zshrc'

# Set variables

# Change ZSH  options

# Create aliases
alias ls='ls -lAFh'

# Customize prompt(s)
PROMPT='
%1~ %L  %# '

RPROMPT='%*'

# Add locations to $PATH variable

# Write handy functions
function mkcd() {
mkdir -p "$@" && cd "$_";
}

# Use ZSH plugins

# ...and other surprises
