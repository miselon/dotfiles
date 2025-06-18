#!/usr/bin/env bash

set -ex

cd
mkdir Applications workspace

sudo pacman -Syu --noconfirm

# Yay
cd Applications
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
cd 

# Some basic apps, tools and stuff
sudo pacman -Sy --noconfirm \
	pipewire wireplumber pipewire-pulse alsa-utils pavucontrol brightnessctl \
	swaync waybar hyprlock hyprpicker \
	xdg-desktop-portal-hyprland archlinux-xdg-menu \
	kitty tmux fzf neovim zsh htop ttf-font-awesome ttf-liberation \
	firefox keepassxc zip unzip vlc 

yay -S hyprshot visual-studio-code-bin

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate

git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Copy dotfiles
cd workspace
git clone https://github.com/miselon/dotfiles

