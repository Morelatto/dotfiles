#!/bin/bash
# Display switching script for easy monitor configuration

case "$1" in
    "default")
        # Default dual monitor setup
        xrandr --output DP-2 --mode 1920x1080 --pos 0x0 --primary \
               --output HDMI-0 --mode 1920x1080 --pos 1920x0
        echo "Switched to default dual monitor setup"
        ;;
    "tv"|"4k")
        # 4K TV setup - adjust the output name and resolution as needed
        # You may need to modify HDMI-0 to the actual TV output
        if xrandr | grep -q "HDMI-0 connected"; then
            xrandr --output HDMI-0 --mode 3840x2160 --primary \
                   --output DP-2 --off
            echo "Switched to 4K TV mode"
        else
            echo "4K TV not detected on HDMI-0"
        fi
        ;;
    "tv-scale")
        # 4K TV with scaling for better readability
        if xrandr | grep -q "HDMI-0 connected"; then
            xrandr --output HDMI-0 --mode 3840x2160 --scale 0.75x0.75 --primary \
                   --output DP-2 --off
            echo "Switched to 4K TV mode with scaling"
        else
            echo "4K TV not detected on HDMI-0"
        fi
        ;;
    "list")
        # List all connected displays
        echo "Connected displays:"
        xrandr | grep " connected"
        ;;
    *)
        echo "Usage: $0 {default|tv|tv-scale|list}"
        echo ""
        echo "  default   - Standard dual monitor setup"
        echo "  tv/4k     - Switch to 4K TV only"
        echo "  tv-scale  - 4K TV with 0.75x scaling"
        echo "  list      - List all connected displays"
        exit 1
        ;;
esac