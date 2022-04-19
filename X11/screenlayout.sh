
#!/usr/bin/env bash

# xrandr --output HDMI-1 --auto --right-of DP-1
xrandr --output DP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-2 --off --output DP-3 --off

