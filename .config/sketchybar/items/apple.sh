#!/usr/bin/env sh

POPUP_OFF="sketchybar --set apple.logo popup.drawing=off"

sketchybar --add item           apple.logo left                             \
                                                                            \
           --set apple.logo     icon=$APPLE                                 \
                                icon.font="$FONT:Black:16.0"                \
                                icon.color=$ORANGE                           \
                                background.padding_left=-8                  \
                                background.padding_right=25                 \
                                label.drawing=off                           \
