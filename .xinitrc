#!/bin/zsh

# TODO: Replace with xremap
if ! xinput list | grep -q HHKB; then
    setxkbmap -option ctrl:nocaps && xmodmap -e "keycode 51 = BackSpace" && xmodmap -e "keycode 22 = backslash bar"
fi

# TODO: Replace with xremap
xset r rate 250 20 && xcape -e 'Control_L=Escape' -t 200

sxhkd & 
exec bspwm
