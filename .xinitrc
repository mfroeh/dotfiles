#!/bin/bash
if ! xinput list | grep -q HHKB; then
    xmodmap -e "keycode 51 = BackSpace"
    xmodmap -e "keycode 22 = backslash bar"
fi

setxkbmap -option ctrl:nocaps &
xcape -e 'Control_L=Escape' -t 200 & 
sxhkd & 
exec bspwm
