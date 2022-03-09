#!/usr/bin/env zsh
light_magenta=$(tput setaf 13)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

echo "${cyan}\n############
${light_magenta}${bold}Starting zsh setup
${reset}${cyan}############$reset\n"

# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq '/opt/homebrew/bin/zsh' '/etc/shells'; then
  echo '/opt/homebrew/bin/zsh exists in /etc/shells'
else
  # echo "Enter superuser (sudo) password to edit /etc/shells"
  echo '/opt/homebrew/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

if [ "$SHELL" = '/opt/homebrew/bin/zsh' ]; then
  echo '$SHELL is /opt/homebrew/bin/zsh'
else
  echo "Enter user password to change login shell"
  chsh -s '/opt/homebrew/bin/zsh'
fi