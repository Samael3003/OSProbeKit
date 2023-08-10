#!/bin/bash

# Define color codes
bold=$(tput bold)
normal=$(tput sgr0)
yellow=$(tput setaf 3)
cyan=$(tput setaf 6)
green=$(tput setaf 2)
red=$(tput setaf 1)

# Function to get the distribution information
get_distribution_info() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRIBUTION="$NAME"
        VERSION="$VERSION_ID"
    elif [ -f /etc/lsb-release ]; then
        . /etc/lsb-release
        DISTRIBUTION="$DISTRIB_ID"
        VERSION="$DISTRIB_RELEASE"
    elif [ -f /etc/debian_version ]; then
        DISTRIBUTION="Debian"
        VERSION=$(cat /etc/debian_version)
    else
        DISTRIBUTION="Unknown"
        VERSION="Unknown"
    fi
}

# Function to get the CPU information
get_cpu_info() {
    CPU_INFO=$(lscpu | grep 'Model name' | awk -F': ' '{print $2}')
}

# Function to get the memory information
get_memory_info() {
    MEMORY_INFO=$(free -h | awk '/^Mem:/ {print $2}')
}

# Function to get the GPU information (requires 'lspci' command)
get_gpu_info() {
    GPU_INFO=$(lspci | grep -i 'VGA' | awk -F': ' '{print $2}')
}

# Function to get the kernel version
get_kernel_version() {
    KERNEL_VERSION=$(uname -r)
}

# Function to get the hostname
get_hostname() {
    HOSTNAME=$(hostname)
}

# Function to get the shell information
get_shell_info() {
    SHELL_INFO=$(echo $SHELL)
}

# Function to get the screen resolution (requires 'xrandr' command)
get_resolution_info() {
    if [ -x "$(command -v xrandr)" ]; then
        RESOLUTION_INFO=$(xrandr | awk '/\*/ {print $1}')
    else
        RESOLUTION_INFO="Unknown (xrandr not found)"
    fi
}

# Function to get the HDD/SSD storage information for /dev/sda and /dev/sdb
get_storage_info() {
    STORAGE_INFO=$(df -h | awk '/^\/dev\/sda|^\/dev\/sdb/ {print $1 ": " $2}')
}

# Function to display the system information
display_system_info() {
    echo "${bold}${yellow}System Information${normal}"
    echo "------------------"
    echo "${cyan}Distribution:${normal} $DISTRIBUTION $VERSION"
    echo "${cyan}CPU:${normal} $CPU_INFO"
    echo "${cyan}Memory:${normal} $MEMORY_INFO"
    echo "${cyan}GPU:${normal} $GPU_INFO"
    echo "${cyan}Kernel Version:${normal} $KERNEL_VERSION"
    echo "${cyan}Hostname:${normal} $HOSTNAME"
    echo "${cyan}Shell:${normal} $SHELL_INFO"
    echo "${cyan}Screen Resolution:${normal} $RESOLUTION_INFO"
    echo "${cyan}Storage:${normal}"
    echo "$STORAGE_INFO"
}

# Main function
main() {
    get_distribution_info
    get_cpu_info
    get_memory_info
    get_gpu_info
    get_kernel_version
    get_hostname
    get_shell_info
    get_resolution_info
    get_storage_info
    display_system_info
}

# Call the main function
main
