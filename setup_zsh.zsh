#!/usr/bin/env zsh

echo "\n<<< Starting zsh setup >>>\n"

echo "Enter to superuser password to edit the /etc/shells"
echo '/usr/local/bin/zsh' | sudo tee -a '/etc/shells'

echo "Enter user password to change login shell"
chsh -s '/usr/local/bin/zsh'