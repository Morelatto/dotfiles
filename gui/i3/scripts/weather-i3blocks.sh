#!/bin/bash
# Weather script for i3blocks (simplified output without polybar formatting)

# Load secrets from age if available
if [[ -f "$HOME/.config/secrets.age" ]] && command -v age >/dev/null 2>&1; then
    eval "$(age --decrypt -i ~/.config/age/keys.txt ~/.config/secrets.age 2>/dev/null)"
fi

# API settings
APIKEY="${WEATHER_API_KEY:?Error: WEATHER_API_KEY environment variable required}"
CITY_NAME='São Paulo'
COUNTRY_CODE='BR'
LANG="pt"
UNITS="metric"

# Get weather data
URL="api.openweathermap.org/data/2.5/weather?appid=$APIKEY&units=$UNITS&lang=$LANG&q=$(echo $CITY_NAME| sed 's/ /%20/g'),${COUNTRY_CODE}"
RESPONSE=$(curl -s "$URL")

if [ $? -eq 0 ]; then
    TEMP=$(echo "$RESPONSE" | jq -r '.main.temp' | cut -d "." -f 1)
    DESCRIPTION=$(echo "$RESPONSE" | jq -r '.weather[0].description' | awk '{for (i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')
    WID=$(echo "$RESPONSE" | jq -r '.weather[0].id')
    
    # Simple icon based on weather ID
    if [ "$WID" -le 232 ]; then
        ICON="⛈️"  # Thunderstorm
    elif [ "$WID" -le 531 ]; then
        ICON="🌧️"  # Rain
    elif [ "$WID" -le 622 ]; then
        ICON="🌨️"  # Snow
    elif [ "$WID" -le 781 ]; then
        ICON="🌫️"  # Atmosphere
    elif [ "$WID" -eq 800 ]; then
        ICON="☀️"  # Clear
    elif [ "$WID" -le 804 ]; then
        ICON="☁️"  # Clouds
    else
        ICON="🌤️"  # Default
    fi
    
    # i3blocks format: full_text, short_text, color
    echo "$ICON $DESCRIPTION $TEMP°C"
    echo "$ICON $TEMP°C"
    echo "#8be9fd"
else
    echo "Weather: Error"
    echo "N/A"
    echo "#6272a4"
fi