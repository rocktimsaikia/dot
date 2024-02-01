> 1. Install all required packages:

```sh
sudo pacman -S --needed exa git starship kitty bat jq github-cli neovim nvim-packer-git
```

> 2. Setup local config, scripts and fonts:

```sh
ln -sf ~/.dot/.local/* ~/.local
```

> 3. Install `yay` for installtion AUR packages

```sh
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

> 3. Setup Neovim config

```sh
ln -sf ~/dot/.config/nvim ~/.config

# Install Packer (nvim package manager)
yay -S nvim-packer-git
```
