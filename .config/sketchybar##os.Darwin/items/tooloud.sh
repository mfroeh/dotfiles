#!/usr/bin/env sh

sketchybar --add       event              volume_change                                               \
           --add       item               tooloud right                                               \
           --set       tooloud            update_freq=10                                              \
                                          label.padding_right=5                                       \
                                          label.padding_left=0                                        \
                                          background.padding_left=24                                  \
                                          background.color=0x33ffffff                                 \
                                          background.corner_radius=5                                  \
                                          background.height=20                                        \
                                          background.padding_right=1                                  \
                                          icon.font="$ICON_FONT:Regular:14.0"                         \
                                          icon.padding_left=5                                         \
                                          icon.padding_right=5                                        \
                                          script="$PLUGIN_DIR/tooloud.sh"                             \
           --subscribe tooloud            volume_change
