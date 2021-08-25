# Set variables 

# Syntax highlighting for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Change ZSH  options

export BAT_CONFIG_PATH="./batconfig

# Create aliases
alias ls='ls -lAFh'
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"

# Customize prompt(s)
PROMPT='
%1~ %L  %# '

RPROMPT='%*'

# Add locations to $PATH variable
# Add Visual Studio Code (code)

# Write handy functions
function mkcd() {
mkdir -p "$@" && cd "$_";
}

# Use ZSH plugins

# ...and other surprises
