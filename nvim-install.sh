#!/bin/bash

# Download and install Neovim
cd "$HOME"
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
mkdir nvim-linux64
tar -xzf nvim-linux64.tar.gz nvim-linux64
ln -s ~/nvim-linux64/bin/nvim ~/.local/bin/nvim

# Install packer.nvim (plugin manager)
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.config/local/share/nvim/site/pack/packer/start/packer.nvim

# Install language servers and formatters via npm
npm install -g typescript typescript-language-server pyright @johnnymorganz/stylua-bin prettier

# Install the lua-language-server and make it available in $PATH
latest_tag="$(curl -sLI https://github.com/LuaLS/lua-language-server/releases/latest | grep location | tail -1 | awk -F'/' '{print $NF}')"
download_url="https://github.com/LuaLS/lua-language-server/releases/download/$latest_tag/lua-language-server-$latest_tag-linux-x64.tar.gz"
wget "$download_url"
mkdir lua-language-server
tar -xzf "lua-language-server-$latest_tag-linux-x64.tar.gz" lua-language-server
ln -s ~/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
