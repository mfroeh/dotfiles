#!/bin/bash

setxkbmap -option ctrl:nocaps && xcape -e 'Control_L=Escape' -t 200

if ! xinput list | grep -q HHKB; then
    xmodmap -e "keycode 51 = BackSpace" && xmodmap -e "keycode 22 = backslash bar"
fi

sxhkd & 
exec bspwm
