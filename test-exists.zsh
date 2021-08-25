#!/usr/bin/env zsh

echo "\n<<< Running $0 >>>\n"

exists brew && echo "holler" || echo "nah man"
exists nonexistant && echo "holler" || echo "nah man"