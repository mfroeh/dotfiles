#!/bin/bash
setxkbmap -option ctrl:nocaps &
xcape -e 'Control_L=Escape' -t 200 & 
sxhkd & 
exec bspwm
