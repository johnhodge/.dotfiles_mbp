#!/usr/bin/env zsh
light_magenta=$(tput setaf 13)
cyan=$(tput setaf 6)
bold=$(tput bold)
reset=$(tput sgr0)

echo "${cyan}\n############
${light_magenta}${bold}Starting zsh setup
${reset}${cyan}############$reset\n"

# https://stackoverflow.com/a/4749368/1341838
if grep -Fxq '/usr/local/bin/zsh' '/etc/shells'; then
  echo '/usr/local/bin/zsh exists in /etc/shells'
else
  # echo "Enter superuser (sudo) password to edit /etc/shells"
  echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells' >/dev/null
fi

if [ "$SHELL" = '/usr/local/bin/zsh' ]; then
  echo '$SHELL is /usr/local/bin/zsh'
else
  echo "Enter user password to change login shell"
  chsh -s '/usr/local/bin/zsh'
fi