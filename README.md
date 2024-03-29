### 1. Requirments

```sh
sudo pacman -S --needed \
exa \
git \
starship \
kitty \
bat \
jq \
github-cli \
neovim \
nvim-packer-git
```

### 2. `.local` setup

> `.local` contains all the custom scripts and fonts

```sh
# Setup local bin scripts
ln -sf ~/dot/.local/bin ~/.local

# Install the custom fonts
ln -sf ~/dot/.local/share/fonts ~/.local/share
fc-cache -f -v
```

### 3. Install [`yay`](https://github.com/Jguer/yay?tab=readme-ov-file#source)

> `yay` is used for installtion of AUR packages

```sh
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### 3. Setup Neovim

```sh
ln -sf ~/dot/.config/nvim ~/.config

# Install Packer (nvim package manager)
yay -S nvim-packer-git

# Install LSP servers and formatters
pnpm add -g typescript \
typescript-language-server \
pyright \
@johnnymorganz/stylua-bin \
@biomejs/biome
```

### 4. Install [`n`](https://github.com/mklement0/n-install?tab=readme-ov-file#n-install--introduction) (Node version manager)

```sh
curl -L https://bit.ly/n-install | bash
```

### 5. Install [`pnpm`](https://pnpm.io/installation#on-posix-systems) (Node package manager)

```sh
curl -fsSL https://get.pnpm.io/install.sh | sh -
```
