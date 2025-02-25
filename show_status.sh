#!/bin/bash

# Fetch weather
WEATHER=$(curl -s "wttr.in?format=3" || echo "Weather unavailable") 

# Fetch system info
USER_NAME=$USER
HOSTNAME=$(hostname)
DIR_PATH=$(pwd)
DATE=$(date)
UPTIME=$(uptime -p) 
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}')
MEMORY=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
DISK=$(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 " used)"}')

# Fetch a random quote from ZenQuotes API
QUOTE=$(curl -s https://zenquotes.io/api/random | jq -r '.[0].q + " — " + .[0].a')

# Clear screen
clear  

# Show OS logo
figlet "Hello, $USER"

# Display system status
echo -e "\n🔹 User: $USER_NAME@$HOSTNAME"
echo -e "🔹 Weather: $(echo "$WEATHER" | lolcat)"
echo -e "🔹 Date: $DATE"
echo -e "🔹 Current Path: $DIR_PATH"

echo -e "\n💻 System Info:"
echo -e "🔹 Uptime: $UPTIME"
echo -e "🔹 CPU Load: $CPU_LOAD"
echo -e "🔹 RAM Usage: $MEMORY"
echo -e "🔹 Disk Usage: $DISK"

# Display the inspirational quote at the bottom
echo -e "\n💡 Motivation for the day:\n\e[1;32m\"$QUOTE\"\e[0m"

echo -e "\n🌟 Stay productive, $USER_NAME! 🚀\n"
