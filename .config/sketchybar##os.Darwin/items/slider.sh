#!/bin/bash

sketchybar --add item volume left                                          \
           --set volume script="sketchybar --set volume icon.width=\$INFO" \
                        icon.background.drawing=on                         \
                        icon.background.color=0xff8aadf4                   \
                        icon.background.height=10                          \
                        icon.background.corner_radius=3                    \
                        icon.width=0                                       \
                        label.drawing=off                                  \
                        background.drawing=on                              \
                        background.color=0xff494d64                        \
                        background.height=10                               \
                        background.corner_radius=3                         \
                        width=100                                          \
           --subscribe volume volume_change
