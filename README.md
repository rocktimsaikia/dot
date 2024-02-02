1. Install all required packages:

```sh
sudo pacman -S --needed exa git starship kitty bat jq github-cli neovim nvim-packer-git
```

2. Setup local scripts and fonts:

```sh
ln -sf ~/dot/.local/bin ~/.local
ln -sf ~/dot/.local/share/fonts ~/.local/share
```

3. Install `yay` for installtion of AUR packages
> Source: https://github.com/Jguer/yay?tab=readme-ov-file#source

```sh
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

3. Setup Neovim config and install Packer (Neovim plugin manager)

```sh
ln -sf ~/dot/.config/nvim ~/.config

# Install Packer (nvim package manager)
yay -S nvim-packer-git
```

4. Install n (Node version manager)
> Source: https://github.com/mklement0/n-install?tab=readme-ov-file#n-install--introduction

```sh
curl -L https://bit.ly/n-install | bash
```

5. Install pnpm (Node package manager)
> Source: https://pnpm.io/installation#on-posix-systems

```sh
curl -fsSL https://get.pnpm.io/install.sh | sh -
```
