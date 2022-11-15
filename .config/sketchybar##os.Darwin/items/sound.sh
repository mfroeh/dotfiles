sketchybar --add item sound right                    \
           --set sound script="$PLUGIN_DIR/sound.sh" \
                       update_freq=5                \
                       label.padding_left=5         \
                       label.padding_right=5        \
                       icon.color=0xffd08770
           --subscribe sound volume_change
