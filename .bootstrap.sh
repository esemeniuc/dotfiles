#!/bin/bash
set -eux

# install regular packages 
sudo pacman -S zsh firefox alacritty rofi rofi-emoji noto-fonts noto-fonts-emoji noto-fonts-cjk xorg-xbacklight flameshot pasystray neovim pasystray fzf tmux keepassxc syncthing rustup tree tailscale qalculate-gtk docker obs-studio xclip

# set up paru
wget https://aur.archlinux.org/cgit/aur.git/snapshot/paru-bin.tar.gz
tar -xzf paru-bin.tar.gz
(cd paru-bin && makepkg -si)

# install aur packages
paru -S yadm volta jetbrains-toolbox nomachine google-chrome slack solana-bin peazip-qt-bin zoom

# oh my zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# tooling setup
rustup install stable
volta install node@16 yarn@1

# tweaks
ln -s /usr/bin/nvim /usr/bin/vim
sudo usermod -aG docker eric # avoid needing root
sudo systemctl enable tailscaled docker syncthing@eric.service

# todo: 
# reduce wait period for nomachine
# set up firefox prefs
# redshift

# manual TODO:
echo set up syncthing via webui at `http://localhost:8384`
echo tailscale with `sudo tailscale login`
echo nomachine via ui
