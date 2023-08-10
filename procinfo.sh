#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Function to display top 20 process information with colors
show_top_processes() {
  clear
  echo -e "-----------------------------------------"
  echo -e "${CYAN}    Top 20 Process Information${NC}"
  echo -e "-----------------------------------------"
  ps -eo pid,%cpu,%mem,vsz,rss,tty,stat,start,time,comm --sort=-%cpu | head -n 11 | \
    awk 'NR==1{print}' # Print the header in white
  ps -eo pid,%cpu,%mem,vsz,rss,tty,stat,start,time,comm --sort=-%cpu | tail -n +2 | head -n 20 | \
    awk '{if ($2 >= 50) color="'$RED'"; else if ($2 >= 20) color="'$YELLOW'"; else color="'$NC'"; \
    printf "%-7s%-6s%-6s%-8s%-8s%-5s%-5s%-12s%-12s${color}%s${NC}\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}'
  echo -e "-----------------------------------------"
}

# Function to refresh the process information every few seconds
refresh_interval=5
while true; do
  show_top_processes
  sleep $refresh_interval
done
