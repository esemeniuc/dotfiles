# dotfiles
a repo for my configs managed by yadm :D

# Getting started
See https://yadm.io/docs/getting_started

# Updating a config file

```bash
yadm add .config/i3status/config
yadm status
yadm commit -m 'updated i3 status'
yadm push
```

# Get config on new system
```bash
yay -S yadm
yadm clone git@github.com:esemeniuc/dotfiles.git
#yadm clone https://github.com/esemeniuc/dotfiles.git
yadm status
```
