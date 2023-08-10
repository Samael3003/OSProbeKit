#!/bin/bash

function get_cpu_usage() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    printf "CPU Usage: %s%.1f%s%%\n" "$(tput setaf 2)" "$cpu_usage" "$(tput sgr0)"
}

function get_memory_usage() {
    local memory_usage=$(free -m | awk '/Mem:/{print $3/$2 * 100.0}')
    printf "Memory Usage: %s%.1f%s%%\n" "$(tput setaf 4)" "$memory_usage" "$(tput sgr0)"
}

function get_disk_usage() {
    printf "Disk Usage:\n"
    df -h | grep -E 'Filesystem|/dev/sd*' | awk '{printf "%-15s: Used: %-10s, Free: %s\n", $1, $3, $4}'
}

function main() {
    tput clear
    echo "$(tput bold)System Resources:$(tput sgr0)"
    echo "---------------------------"

    get_cpu_usage
    get_memory_usage
    get_disk_usage
}

main
