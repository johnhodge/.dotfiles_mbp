# Set variables
export HOMEBREW_CASK_OPTS="--no-quarantine"
export NULLCMD=bat

# Change ZSH  options
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Create aliases
alias ls='exa -laFh --git'
alias exa='exa -laFh --git'
alias man='batman'
alias bbd='brew bundle dump --force --all --verbose --describe'
alias trail='<<<${(F)path}'
alias python='python3'
alias pip='pip3'

# Customize prompt(s)
bold=$(tput bold)
reset=$(tput sgr0)

black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
bright_black=$(tput setaf 8)
bright_red=$(tput setaf 9)
bright_green=$(tput setaf 10)
bright_yellow=$(tput setaf 11)
bright_blue=$(tput setaf 12)
bright_magenta=$(tput setaf 13)
bright_cyan=$(tput setaf 14)
bright_white=$(tput setaf 15)

setopt PROMPT_SUBST

prompt_time() {
    echo %{$blue%}"%*"%{$reset%}
}

prompt_dir() {
    echo %{$bold$magenta%}%c %{$reset%}
}

prompt_lvl() {
    echo %{$bright_black%}%L %{$reset%}
}

git_branch_name() {
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]]; then
    :
  else
    echo '- ('$branch')'
  fi
}

prompt_git() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else 
        if [[ `git status --porcelain --untracked-files=no` ]]; then
                echo %{$bold$yellow%}"[$branch] "%{$reset%}
        else
            if [[ `git status --porcelain --untracked-files=normal` ]]; then
                echo %{$bold$blue%}"[$branch] "%{$reset%}
        else
            echo %{$bold$green%}"[$branch] "%{$reset%}
            fi
        fi
    fi
}

prompt_symbol() {
    echo %{$bold$cyan%}"→" %{$reset%}
}

prompt_virtualenv() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        venv="${VIRTUAL_ENV##*/}"
    else
        venv=''
    fi
    [[ -n "$venv" ]] && echo %{$bold$white%}"[$venv]" %{$reset%}
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

build_prompt() {
    echo $(prompt_virtualenv)$(prompt_dir)$(prompt_lvl)$(prompt_git)$(prompt_symbol)
}

build_rprompt() {
    echo $(prompt_time)
}

export PROMPT='$(build_prompt)'
export RPROMPT='$(build_rprompt)'

# Add locations to $PATH variable
# Add Home-brew
export PATH="$PATH:/opt/homebrew/bin/brew"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add Python 10
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"

# Add Geckodriver
export PATH="$PATH:/opt/homebrew/bin/geckodriver"

# Add GoLang
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Add Madhive protos
export PATH=$PATH:$GOPATH/src/github.com/MadHive/taco/protos

# Functions
# Make directory and navigate inside it
function mkcd() {
    mkdir -p "$@" && cd "$_";
}

# Make file and navigate to it
function to() {
    touch "$@" && open "$_";
}

# Support for toptal gitignore generator CLI
function gi() { 
    curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;
}

# Create repo and add gitignore file
function grc() {
inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [[ "$inside_git_repo" ]]; then
            echo "Git initialized."
        else
            echo "Initializing git..."
            git init
    fi
    echo "Creating repo..."
    if [[ "$1" != "" ]]; then
            gh repo create --source=. --private
            echo "Generating .gitignore template for visualstudiocode,macos,$1." 
            gi visualstudiocode,macos,"$1" >> .gitignore 
        else
            gh repo create --source=. --private
            echo "Generating .gitignore template for visualstudiocode,macos." 
            gi visualstudiocode,macos >> .gitignore  
    fi
}

# Use ZSH plugins
plugins=(autopep8,brew,dotenv,gatsby,gcloud,gh)

# Add NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
