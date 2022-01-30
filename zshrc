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

COLOR_DEF='%f'
COLOR_DIR='%F{216}'
COLOR_LVL='%F{6}'
COLOR_GIT='%F{75}'
COLOR_SYMBOL='%F{87}'
setopt PROMPT_SUBST

prompt_dir() {
    echo $COLOR_DIR%c ' '
}

prompt_lvl(){
    echo $COLOR_LVL%L ' '
}

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

prompt_git() {
    git check-ignore -q . 2>/dev/null; if [ "$?" -ne "1" ]; then
        echo ''
    else echo $COLOR_GIT%B$(parse_git_branch) %b
    fi
}

prompt_symbol() {
    echo %B$COLOR_SYMBOL→%b $COLOR_DEF% 
}

build_prompt() {
    echo $(prompt_dir)$(prompt_lvl)$(prompt_git)$(prompt_symbol)
}

export PROMPT='$(build_prompt)'

RPROMPT='%*'

# Add locations to $PATH variable
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Functions
# Make directory and navigate inside it
function mkcd() {
    mkdir -p "$@" && cd "$_";
}

# Support for toptal gitignore generator CLI
function gi() { 
    curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}

# Create repo and add gitignore file
function grc() {
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ "$inside_git_repo" ]
        then
            echo "Git initialized."
        else
            echo "Initializing git..."
            git init
    fi
    echo "Creating repo..."
    if [ "$1" != "" ]
        then
            gh repo create 
            echo "Generating .gitignore template for macos,$1." 
            gi macos,"$1" >> .gitignore 
        else
            gh repo create 
            echo "Generating .gitignore template for macos." 
            gi macos >> .gitignore  
    fi
}


function gitall() {
    git add .
    if [ "$1" != "" ]
    then
        git commit -m "$1"
    else
        git commit -m update # default commit message is `update`
    fi # closing statement of if-else block
    git push origin HEAD
}

# Use ZSH plugins
# ...and other surprises
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
