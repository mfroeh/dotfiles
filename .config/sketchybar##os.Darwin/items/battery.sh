sketchybar --add item battery right                      \
           --set battery script="$PLUGIN_DIR/battery.sh" \
                         update_freq=10 \
                         label.padding_left=5 \
                         label.padding_right=5 \
           
           --subscribe battery system_woke
