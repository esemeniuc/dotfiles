#!/bin/bash
set -eux

# install regular packages 
sudo pacman -S zsh firefox alacritty rofi rofi-emoji noto-fonts noto-fonts-emoji noto-fonts-cjk flameshot pasystray neovim pasystray fzf tmux keepassxc syncthing tree tailscale qalculate-gtk docker obs-studio xclip

# dev tooling
sudo pacman -S clang make mold protobuf rustup

# set up paru
wget https://aur.archlinux.org/cgit/aur.git/snapshot/paru-bin.tar.gz
tar -xzf paru-bin.tar.gz
(cd paru-bin && makepkg -si)

# install aur packages
paru -S yadm volta jetbrains-toolbox nomachine google-chrome slack-bin solana-bin peazip-qt-bin zoom

# oh my zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# tooling setup
rustup install stable
volta install node@16 yarn@1

# tweaks
ln -s /usr/bin/nvim /usr/bin/vim
sudo usermod -aG docker eric # avoid needing root
sudo systemctl enable tailscaled docker syncthing@eric.service
sudo bash -c "echo DefaultTimeoutStopSec=10s >> /etc/systemd/system.conf"

# todo: 
# reduce wait period for nomachine
# set up firefox prefs
# redshift
# power saving
# manual TODO:
echo set up syncthing via webui at `http://localhost:8384`
echo tailscale with `sudo tailscale login`
echo docker login
echo nomachine via ui
echo setup jetbrains toolbox + ide
