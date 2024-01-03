#!/bin/bash

# Setup Neovim
ln -s ~/dot/.config/nvim ~/.config/nvim

# Install packer.nvim (plugin manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.config/local/share/nvim/site/pack/packer/start/packer.nvim

# Install language servers and formatters via npm
npm install -g typescript typescript-language-server pyright @johnnymorganz/stylua-bin prettier

# Install the lua-language-server and make it available in $PATH
latest_tag="$(curl -sLI https://github.com/LuaLS/lua-language-server/releases/latest | grep location | tail -1 | awk -F'/' '{print $NF}')"
download_url="https://github.com/LuaLS/lua-language-server/releases/download/$latest_tag/lua-language-server-$latest_tag-linux-x64.tar.gz"
wget -P $HOME "$download_url"
cd $HOME && mkdir lua-language-server
tar -xzf "lua-language-server-$latest_tag-linux-x64.tar.gz" lua-language-server
ln -s $HOME/lua-language-server/bin/lua-language-server $HOME/.local/bin/lua-language-server
