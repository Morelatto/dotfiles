#!/bin/sh

SCT_ARGS="maim"
PARTIAL=0
WINDOW=0

screenshot() {
    SAVE_LOCATION=$HOME/Pictures/Screenshot
    SAVE_FILE="$(date +%F_%H-%M-%S)-Screenshot.png"
    
    if [ $PARTIAL -gt 0 ]; then
        SCT_ARGS="$SCT_ARGS -s"
    elif [ $WINDOW -gt 0 ]; then
        SCT_ARGS+=" -i \$(xdotool getactivewindow)"
    fi
    eval $SCT_ARGS | tee "$SAVE_LOCATION/$SAVE_FILE" | xclip -sel clip -t image/png
}

case $1 in
    "partial") PARTIAL=1;;
    "full") FULL=1;;
    "window") WINDOW=1;;
esac

screenshot
