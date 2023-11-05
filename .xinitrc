#!/bin/sh

# To run xremap without sudo, do below and reboot
# If `lsmod | grep uinput` empty, add `uinput` to `/etc/modules-load.d/uinput.conf`
# Then run `echo 'KERNEL=="uinput", GROUP="input", TAG+="uaccess"' | sudo tee /etc/udev/rules.d/99-input.rules`

lxpolkit &
picom -b &
xremap ~/dotfiles/xremap/config.yaml &
exec i3
