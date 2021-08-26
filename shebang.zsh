#!/usr/bin/env zsh

echo "\n<<< Running $0 >>>"
echo "ZSH_VERSION: $ZSH_VERSION "
echo "The current shell is $(ps $$ -ocomm=)\n"

exists brew && echo "holler" || echo "nah man"
exists nonexistant && echo "holler" || echo "nah man"