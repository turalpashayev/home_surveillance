#!/bin/bash

# Use aplay -l to list devices and grep to find the desired card
# Adjust the grep search term as needed to match your device name
card_number=$(aplay -l | grep -m 1 'UACDemoV1.0' | awk '{print $2}' | tr -d ':')

# If the card is not found, exit the script
if [ -z "$card_number" ]; then
    echo "Audio device not found."
    exit 1
fi

# Extract just the card number
device_number="0"  # Assuming device number is 0, adjust if necessary

# Set volume
amixer -c "$card_number" set PCM 75%

# Play the sound
for i in {1..3}
do
   aplay -D "plughw:$card_number,$device_number" /data/Gear\ Warning.wav
done