#!/usr/bin/env zsh
light_magenta=$(tput setaf 13)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

echo "${cyan}\n############
${light_magenta}${bold}Starting utils setup
${reset}${cyan}############$reset\n"

duti -sv com.microsoft.VSCode css all
duti -sv com.microsoft.VSCode json all
duti -sv com.microsoft.VSCode txt all