#!/bin/sh

# The file to store output file
output_file="/data/output.txt"

# Use ps and grep to check if ngrok is running
if ! ps aux | grep -v grep | grep 'ngrok http' > /dev/null; then
    # If ngrok is not running, print a message
    echo "Ngrok is not running. Attempting to start..."
    # Start ngrok
    /data/./ngrok http --domain=apt-ultimate-leech.ngrok-free.app 80 --config=/data/ngrok.yml
    if [ $? -eq 0 ]; then
        echo "Ngrok started successfully."
    else
        echo "Failed to start ngrok."
    fi
else
    echo "Ngrok is already running."
fi