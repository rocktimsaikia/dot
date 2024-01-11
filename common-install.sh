#!/bin/bash

# Install bat | A better cat
# https://github.com/sharkdp/bat
if [ -x "$(command -v bat)"  ]; then
	echo "- bat is already installed ✅ Skipping.."
else
	sudo apt install bat
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat
fi

# Install starship | A better prompt
# https://starship.rs/guide/
if [ -x "$(command -v starship)"  ]; then
	echo "- starship is already installed ✅ Skipping.."
else
	curl -sS https://starship.rs/install.sh | sh
	echo 'eval "$(starship init zsh)"' >> ~/.config/zsh/.zshrc
fi

