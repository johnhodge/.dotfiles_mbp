#!/usr/bin/env zsh
light_magenta=$(tput setaf 13)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

echo "${cyan}\n############
${light_magenta}${bold}Starting homebrew setup
${reset}${cyan}############$reset\n"

if exists brew; then
    echo "Brew exists, skipping install"
else
    echo "Brew doesn't exist, continuing with install:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    if [[ $(arch) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > zprofile && ln -s ${PWD}/zprofile ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

brew bundle --verbose