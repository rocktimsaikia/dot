#!/bin/bash

command_exists() {
	command -v "$1" > /dev/null 2>&1
}

# Install bat | A better cat
# https://github.com/sharkdp/bat
if command_exists bat; then
	echo "- bat is already installed ✅ Skipping.."
else
	sudo apt install bat
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# Install starship | A better prompt
# https://starship.rs/guide/
if command_exists starship; then
	echo "- starship is already installed ✅ Skipping.."
else
	curl -sS https://starship.rs/install.sh | sh
	echo 'eval "$(starship init zsh)"' >> ~/.config/zsh/.zshrc
fi

# Install n | Simple Node version manager
if command_exists n; then
	echo "- n is already installed ✅ Skipping.."
else
	curl -L https://bit.ly/n-install | bash
fi
