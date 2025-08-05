#!/usr/bin/env bash

# Polybar-style utility functions for i3blocks
# Shared functions for progress bars, colors, and formatting

# Color scheme (Dracula-inspired)
export COLOR_RED="#ff5555"      # Critical/High usage
export COLOR_ORANGE="#ffb86c"   # Warning/Medium-high  
export COLOR_YELLOW="#f1fa8c"   # Caution/Medium
export COLOR_GREEN="#50fa7b"    # Good/Low
export COLOR_CYAN="#8be9fd"     # Info/Special
export COLOR_PURPLE="#bd93f9"   # Accent/Neutral
export COLOR_GRAY="#6272a4"     # Disabled/N/A
export COLOR_WHITE="#f8f8f2"    # Text

# Unicode progress bar characters (properly handled for i3blocks)
export BLOCK_FULL="█"     # U+2588 - Full block
export BLOCK_EMPTY="░"    # U+2591 - Light shade
export BLOCK_MED="▒"      # U+2592 - Medium shade
export BLOCK_DARK="▓"     # U+2593 - Dark shade

# Alternative circular progress
export CIRCLE_FULL="●"    # U+25CF - Black circle
export CIRCLE_EMPTY="○"   # U+25CB - White circle

# Thin progress bars (elegant Unicode)
export THIN_FULL="▰"      # U+25B0 - Black rectangle
export THIN_EMPTY="▱"     # U+25B1 - White rectangle

# ASCII fallback (for compatibility)
export ASCII_FULL="#"
export ASCII_EMPTY="-"

# Font Awesome icons with proper pango markup
export FA_CPU="<span font='FontAwesome'></span>"      # U+F0E7 - CPU icon
export FA_MEMORY="<span font='FontAwesome'></span>"   # U+F2DB - Memory icon  
export FA_TEMP="<span font='FontAwesome'></span>"     # U+F2C9 - Temperature icon
export FA_DISK="<span font='FontAwesome'></span>"     # U+F0A0 - Disk icon

# Legacy create_progress_bar function (replaced by modern version below)

# Legacy create_gradient_bar function (replaced by modern version below)

# Get color based on percentage thresholds
get_threshold_color() {
    local percentage=$1
    local reverse=${2:-false}  # For things like temperature where high is bad
    
    if [[ $reverse == "true" ]]; then
        if [[ $percentage -ge 90 ]]; then echo "$COLOR_RED"
        elif [[ $percentage -ge 80 ]]; then echo "$COLOR_ORANGE"
        elif [[ $percentage -ge 70 ]]; then echo "$COLOR_YELLOW"
        else echo "$COLOR_GREEN"
        fi
    else
        if [[ $percentage -ge 80 ]]; then echo "$COLOR_RED"
        elif [[ $percentage -ge 60 ]]; then echo "$COLOR_ORANGE"
        elif [[ $percentage -ge 40 ]]; then echo "$COLOR_YELLOW"
        else echo "$COLOR_GREEN"
        fi
    fi
}

# Format bytes with appropriate units
format_bytes() {
    local bytes=$1
    local precision=${2:-1}
    
    if ((bytes >= 1073741824)); then
        echo "$(echo "scale=$precision; $bytes / 1073741824" | bc)GB"
    elif ((bytes >= 1048576)); then
        echo "$(echo "scale=$precision; $bytes / 1048576" | bc)MB"
    elif ((bytes >= 1024)); then
        echo "$(echo "scale=$precision; $bytes / 1024" | bc)KB"
    else
        echo "${bytes}B"
    fi
}

# Format frequency
format_frequency() {
    local freq_mhz=$1
    
    # Handle decimal input and round to integer
    local freq_int=$(printf "%.0f" "$freq_mhz")
    
    if ((freq_int >= 1000)); then
        local freq_ghz=$(echo "scale=1; $freq_int / 1000" | bc)
        echo "${freq_ghz}GHz"
    else
        echo "${freq_int}MHz"
    fi
}

# Create Font Awesome styled output with pango markup
create_fa_output() {
    local icon="$1"
    local text="$2"
    local color="${3:-$COLOR_WHITE}"
    
    echo "<span font='FontAwesome' color='$color'>$icon</span> $text"
}

# Create modern progress bar (multiple styles)
create_progress_bar() {
    local percentage=$1
    local width=${2:-8}
    local style=${3:-"blocks"}  # "blocks", "thin", "circles", "shaded", "ascii"
    
    local filled=$((percentage * width / 100))
    local empty=$((width - filled))
    
    case $style in
        "blocks")
            local fill_char="$BLOCK_FULL"
            local empty_char="$BLOCK_EMPTY"
            ;;
        "thin")
            local fill_char="$THIN_FULL"
            local empty_char="$THIN_EMPTY"
            ;;
        "circles") 
            local fill_char="$CIRCLE_FULL"
            local empty_char="$CIRCLE_EMPTY"
            ;;
        "shaded")
            local fill_char="$BLOCK_DARK"
            local empty_char="$BLOCK_EMPTY"
            ;;
        "ascii")
            local fill_char="$ASCII_FULL"
            local empty_char="$ASCII_EMPTY"
            ;;
    esac
    
    # Create seamless progress bar with proper UTF-8 encoding
    local bar=""
    for ((i=0; i<filled; i++)); do bar+="$fill_char"; done
    for ((i=0; i<empty; i++)); do bar+="$empty_char"; done
    
    # Output with proper UTF-8 locale
    LC_ALL=C.UTF-8 echo "$bar"
}

# Create gradient progress bar with multiple shades
create_gradient_bar() {
    local percentage=$1
    local width=${2:-8}
    
    local filled=$((percentage * width / 100))
    local empty=$((width - filled))
    
    # Use gradient: full -> dark -> medium -> light -> empty
    local bar=""
    if [ $filled -gt 0 ]; then
        local full_blocks=$((filled * 3 / 4))
        local dark_blocks=$((filled - full_blocks))
        
        for ((i=0; i<full_blocks; i++)); do bar+="$BLOCK_FULL"; done
        for ((i=0; i<dark_blocks; i++)); do bar+="$BLOCK_MED"; done
    fi
    
    for ((i=0; i<empty; i++)); do bar+="$BLOCK_EMPTY"; done
    
    # Output with proper UTF-8 locale
    LC_ALL=C.UTF-8 echo "$bar"
}

# Create notification with consistent styling
show_notification() {
    local title="$1"
    local message="$2"
    local urgency="${3:-normal}"
    local timeout="${4:-5000}"
    
    notify-send \
        --app-name="i3blocks" \
        --urgency="$urgency" \
        --expire-time="$timeout" \
        "$title" "$message"
}

# Get CPU frequency
get_cpu_frequency() {
    local freq=$(cat /proc/cpuinfo | grep "cpu MHz" | head -1 | awk '{print $4}')
    format_frequency "$freq"
}

# Get load average as percentage (based on CPU cores)
get_load_percentage() {
    local load=$(cut -d' ' -f1 /proc/loadavg)
    local cores=$(nproc)
    local percentage=$(echo "scale=0; $load * 100 / $cores" | bc)
    
    # Cap at 100%
    if ((percentage > 100)); then percentage=100; fi
    echo "$percentage"
}