#!/bin/bash

# ANSI escape codes for colors
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Function to show the menu and get user's choice
show_menu() {
  echo -e "${GREEN}Choose an option:${NC}"
  printf "1. ${YELLOW}Show connection info${NC}\n"
  printf "2. ${YELLOW}Show process information${NC}\n"
  printf "3. ${YELLOW}Show system info${NC}\n"
  printf "4. ${YELLOW}Show system resource info${NC}\n"
}

# Function to execute the selected file based on user's choice
execute_option() {
  case $1 in
    1) sudo ./connecinfo.sh ;;
    2) ./procinfo.sh ;;
    3) ./sysinfo.sh ;;
    4) ./sysresinfo.sh ;;
    *) echo -e "${RED}Invalid option. Please choose a number from 1 to 4.${NC}" ;;
  esac
}

# Main script
echo -e "${GREEN}Welcome to My System Information Script${NC}"
show_menu
read -p "Enter your choice (1-4):" choice

# Call the execute_option function with the user's choice
execute_option $choice
