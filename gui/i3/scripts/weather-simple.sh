#!/usr/bin/env bash
# Working weather script for i3blocks based on proven examples

# Try wttr.in first (simpler, no API key needed)
WEATHER_RAW=$(curl -s --max-time 5 "https://wttr.in/?format=%C+%t" 2>/dev/null)

# Add appropriate weather icon based on condition
if [[ "$WEATHER_RAW" =~ "Clear" ]] || [[ "$WEATHER_RAW" =~ "Sunny" ]]; then
    ICON="☀️"
elif [[ "$WEATHER_RAW" =~ "Cloud" ]] || [[ "$WEATHER_RAW" =~ "Overcast" ]]; then
    ICON="☁️"
elif [[ "$WEATHER_RAW" =~ "Rain" ]] || [[ "$WEATHER_RAW" =~ "Drizzle" ]]; then
    ICON="🌧️"
elif [[ "$WEATHER_RAW" =~ "Snow" ]]; then
    ICON="🌨️"
elif [[ "$WEATHER_RAW" =~ "Thunder" ]] || [[ "$WEATHER_RAW" =~ "Storm" ]]; then
    ICON="⛈️"
elif [[ "$WEATHER_RAW" =~ "Fog" ]] || [[ "$WEATHER_RAW" =~ "Mist" ]]; then
    ICON="🌫️"
else
    ICON="🌤️"
fi

WEATHER="$ICON $WEATHER_RAW"

# If wttr.in fails, try with your existing OpenWeatherMap setup
if [ -z "$WEATHER" ] || [[ "$WEATHER" =~ "Unknown" ]] || [[ "$WEATHER" =~ "ERROR" ]]; then
    # Load secrets if available
    if [[ -f "$HOME/.config/secrets.age" ]] && command -v age >/dev/null 2>&1; then
        eval "$(age --decrypt -i ~/.config/age/keys.txt ~/.config/secrets.age 2>/dev/null)"
    fi
    
    if [ -n "$WEATHER_API_KEY" ]; then
        WEATHER_DATA=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=São Paulo,BR&appid=$WEATHER_API_KEY&units=metric" 2>/dev/null)
        if [ -n "$WEATHER_DATA" ]; then
            TEMP=$(echo "$WEATHER_DATA" | grep -o '"temp":[0-9]*' | cut -d: -f2)
            DESC=$(echo "$WEATHER_DATA" | grep -o '"main":"[^"]*' | cut -d: -f2 | tr -d '"')
            if [ -n "$TEMP" ] && [ -n "$DESC" ]; then
                WEATHER="$DESC ${TEMP}°C"
            fi
        fi
    fi
fi

# Output for i3blocks (3 lines: full_text, short_text, color)
if [ -n "$WEATHER" ] && [ "$WEATHER" != "N/A" ]; then
    echo "$WEATHER"
    echo "$WEATHER"
    echo "#8be9fd"
else
    echo "Weather N/A"
    echo "N/A"
    echo "#6272a4"
fi