#!/usr/bin/env zsh
light_magenta=$(tput setaf 13)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

echo "${cyan}\n############
${light_magenta}${bold}Starting zsh setup
${reset}${cyan}############$reset\n"

if [[ $(arch) == 'arm64' ]]; then
    shell_path=/opt/homebrew/bin/zsh
else
    shell_path=/usr/local/bin/zsh
fi

# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq ${shell_path} '/etc/shells'; then
    echo ${shell_path}' exists in /etc/shells'
else
    # echo "Enter superuser (sudo) password to edit /etc/shells"
    echo ${shell_path} | sudo tee -a '/etc/shells' >/dev/null
fi

if [ "$SHELL" = ${shell_path} ]; then
    echo '$SHELL is '${shell_path} 
else
    echo "Enter user password to change login shell"
    chsh -s ${shell_path} 
fi