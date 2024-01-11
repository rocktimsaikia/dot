#!/bin/bash

# Install bat | A better cat
if [ -x "$(command -v bat)"  ]; then
	echo "bat is already installed ✅ Skipping.."
	exit 0
else
	sudo apt install bat
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat
fi
