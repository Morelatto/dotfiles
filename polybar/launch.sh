#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for i in /sys/class/hwmon/hwmon*/temp*_input; do 
    if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: Package id 0" ]; then
        export HWMON_PATH_CPU="$i"
    elif [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "nvme: Composite" ]; then
        export HWMON_PATH_NVME="$i"
    fi
done

# Launch the bar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar b1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar b2 2>&1 | tee -a /tmp/polybar2.log & disown
