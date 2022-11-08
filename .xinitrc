#!/bin/bash
xcape -e 'Control_L=Escape' -t 200 & 
sxhkd & 
exec bspwm
