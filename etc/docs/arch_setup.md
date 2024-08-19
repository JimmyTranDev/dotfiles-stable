# Arch Setup

## Install nvidia driver

https://wiki.hyprland.org/Nvidia/

## Paru

cd ~/Programming && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

## Oh my Zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash


## Add to user group

sudo usermod -a -G input $USER

## Samba
https://wiki.archlinux.org/title/Samba
1.1 Installation
1.3.3 Enable Usershares
