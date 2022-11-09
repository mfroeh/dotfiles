#!/usr/bin/env bash

if system_profiler SPAudioDataType | grep --quiet "External Headphones"; then
    VOLUME=$(osascript -e "get volume settings" | cut -d " " -d ":" -f2 | cut -d "," -f1)

    if [ $VOLUME -gt 30 ]; then
        COLOR=0xffffd152
        ICON=""
        LCOLOR=0x88000000
        if [ $VOLUME -gt 37 ]; then
            COLOR=0xfffcb462
            if [ $VOLUME -gt 40 ]; then
                COLOR=0xfffc9562
                if [ $VOLUME -gt 45 ]; then
                    COLOR=0xffe8555b
                    ICON=" $ICON"
                    LCOLOR=0xffffffff
                fi
            fi
        fi
        sketchybar -m --animate lin 5                           \
                      --set $NAME   background.drawing=on       \
                                    background.color="$COLOR"   \
                                    label.drawing=on            \
                                    label="$VOLUME%"            \
                                    label.color="$LCOLOR"       \
                                    icon="$ICON"                \
                                    icon.color="$LCOLOR"        \
                                    icon.drawing=on             \
                                    y_offset=3                  \
                                    y_offset=0
    else
        sketchybar -m --set $NAME label.drawing=off icon.drawing=off background.drawing=off
    fi
else
    sketchybar -m --set $NAME label.drawing=off icon.drawing=off background.drawing=off
fi
