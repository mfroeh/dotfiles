SPACE_ICONS=("􀋃" "􀎭" "􀇩" "􀪏" "􀌥" "6" "7" "8" "9" "10")

for i in "${!SPACE_ICONS[@]}"
do
    sid=$(($i+1))
    sketchybar --add space space.$sid left     \
        --set space.$sid associated_space=$sid     \
                         icon=${SPACE_ICONS[i]}                     \
                         icon.padding_left=4                        \
                         icon.padding_right=4                       \
                         background.padding_left=5                  \
                         background.padding_right=5                 \
                         background.color=0x44ffffff                \
                         background.corner_radius=5                 \
                         background.height=27                 \
                         background.drawing=off                     \
                         label.drawing=off                          \
                         script="$PLUGIN_DIR/space.sh"              \
                         click_script="yabai -m space --focus $sid" \
                         icon.font="$FONT:Light:15.0"
done