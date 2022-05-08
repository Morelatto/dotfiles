#!/bin/sh

SCREENSHOTER="maim"
TIMESTAMP=$(date +%F_%H-%M-%S)
SAVE_LOCATION=~/Pictures
SAVE_FILE="$SAVE_LOCATION/$TIMESTAMP-Screenshot.png"

screenshot() {
    if [ "$PART" -gt 0 ]; then
        SCREENSHOTER+=" -s"
    elif [ "$WIND" -gt 0 ]; then
        SCREENSHOTER+=" -i \$(xdotool getactivewindow)"
    fi
    eval $SCREENSHOTER | tee $SAVE_FILE | xclip -sel clip -t image/png
}

case $1 in
    "partial") PART=1;;
    "full") FULL=1;;
    "window") WIND=1;;
esac

screenshot