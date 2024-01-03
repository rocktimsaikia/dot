#!/bin/bash

# Setup Neovim
ln -s ~/dot/.config/nvim ~/.config/nvim

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.config/local/share/nvim/site/pack/packer/start/packer.nvim

# Install language servers via npm
npm install -g typescript typescript-language-server pyright

# Install lua-language-server manually
latest_tag="$(curl -sLI https://github.com/LuaLS/lua-language-server/releases/latest | grep location | tail -1 | awk -F'/' '{print $NF}')"
download_url="https://github.com/LuaLS/lua-language-server/releases/download/$latest_tag/lua-language-server-$latest_tag-linux-x64.tar.gz"
wget -P $HOME "$download_url"
cd $HOME
tar -xzf "lua-language-server-$latest_tag-linux-x64.tar.gz" lua-language-server

