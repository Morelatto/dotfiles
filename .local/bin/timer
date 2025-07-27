#!/bin/bash

# Check if the duration argument is provided
if [ -z "$1" ]; then
    echo "Please provide the duration in seconds as an argument."
    exit 1
fi

# Set the duration of the timer from the argument
duration=$1

# Loop until the duration is reached
while [ $duration -gt 0 ]; do
    # Print the remaining time on the same line
    echo -ne "Time remaining: $duration seconds\033[0K\r"

    # Sleep for 1 second
    sleep 1

    # Decrement the duration by 1
    duration=$((duration - 1))
done

# Timer has finished
echo -e "\nTimer finished!"
