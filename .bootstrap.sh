#!/bin/bash
set -eux

# install regular packages 
sudo pacman -S zsh firefox alacritty rofi rofi-emoji noto-fonts noto-fonts-emoji noto-fonts-cjk flameshot pasystray neovim pasystray fzf tmux keepassxc syncthing tree tailscale qalculate-gtk docker obs-studio xclip python

# dev tooling
sudo pacman -S clang make mold protobuf rustup postgresql terraform docker-compose

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

# laptop setup
sudo pacman -S tlp
sudo systemctl enable tlp.service
sudo systemctl start tlp.service

# tweaks
ln -s /usr/bin/nvim /usr/bin/vim
sudo usermod -aG docker eric # avoid needing root
sudo systemctl enable tailscaled docker syncthing@eric.service
sudo bash -c "echo DefaultTimeoutStopSec=10s >> /etc/systemd/system.conf"

# customize firefox
PROFILE_DIR=$(grep -Pzo "\[Profile0\]\n(.*?\n){2}Path=\K\w+.[\w-]+" ~/.mozilla/firefox/profiles.ini | tr -d '\0')
PROFILE_PATH=~/.mozilla/firefox/${PROFILE_DIR}
mkdir -p ${PROFILE_PATH}/chrome

cat > ${PROFILE_PATH}/user.js <<- EOM
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("full-screen-api.transition.timeout", 0); // integer
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.delay", 0);
user_pref("full-screen-api.warning.timeout", 0);
user_pref("toolkit.cosmeticAnimations.enabled", false);
user_pref("browser.fullscreen.autohide", false);
user_pref("ui.prefersReducedMotion", 1);
EOM

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
