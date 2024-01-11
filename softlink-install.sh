#!/bin/bash

CURRENT_DIR="$PWD"

# Custom scripts
printf "\nCreating softlink for custom scripts...\n"
ln -s "$CURRENT_DIR/scripts" "$HOME/scripts"

# Neovim
printf "\nCreating softlink for Neovim...\n"
ln -s "$HOME/dot/.config/nvim" "$HOME/.config/nvim"
