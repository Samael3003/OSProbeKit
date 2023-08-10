#!/bin/bash

# ANSI escape codes for text colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Function to list connections and corresponding server IP addresses
list_connections() {
    echo -e "${GREEN}List of connections:${RESET}"
    printf "%-25s %s\n" "Connection" "Server IP"
    netstat -tuln | awk 'NR > 2 {printf "%-25s %s\n", $4, "-> " $5}'
    echo -e "${YELLOW}----------------------${RESET}"
}

# Check if the script is run with root privileges
if [ "$EUID" -ne 0 ]; then
    echo -e "${GREEN}This script must be run as root to fetch full connection details.${RESET}"
    exit 1
fi

# Call the function to list connections and server IP addresses
list_connections
