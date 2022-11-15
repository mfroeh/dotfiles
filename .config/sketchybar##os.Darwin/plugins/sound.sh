#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

VOLUME=$(osascript -e "output volume of (get volume settings)")
MUTED=$(osascript -e "output muted of (get volume settings)")

if [[ $MUTED != "false" ]]; then
ICON=$MUTED
else
ICON=$SPEAKER_WAVE_3
# case ${VOLUME} in
#   9[0-9]) ICON="";;
#   8[0-9]) ICON="";;
#   7[0-9]) ICON="";;
#   6[0-9]) ICON="";;
#   5[0-9]) ICON="";;
#   4[0-9]) ICON="";;
#   3[0-9]) ICON="";;
#   2[0-9]) ICON="";;
#   1[0-9]) ICON="";;
#   [0-9]) ICON="";;
#   *) ICON=""
# esac
fi

sketchybar --set $NAME icon="$ICON" label="${VOLUME}"
