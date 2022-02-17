#!/usr/bin/env zsh

echo "\n############\nStarting homebrew setup\n############\n"

if exists brew; then
    echo "Brew exists, skipping install"
else
    echo "Brew doesn't exist, continuing with install:"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew bundle --verbose