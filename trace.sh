#!/bin/bash

# Colors
RED='\033[0;31m'
NC='\033[0m' # No Color

# Display banner
echo -e "${RED}"
echo -e "  _______"
echo -e " /       \\"
echo -e "|  () ()  |"
echo -e " \\  ___  /"
echo -e "  |_____|"
echo -e " /       \\"
echo -e "|         |"
echo -e " \\_______/"
echo -e "   _|_|_"
echo -e "  /  |  \\"
echo -e " /   |   \\"
echo -e "|____|____|"
echo -e "${NC}"

# API endpoint
API_URL="https://ipapi.co"

# Function to fetch IP info
fetch_ip_info() {
    local ip="$1"
    echo "Fetching information for IP: $ip"
    curl -s "${API_URL}/${ip}/json/"
}

# Display menu
show_menu() {
    echo "IP Information Script"
    echo "1. Get information for a specific IP"
    echo "2. Get information for your own IP"
    echo "3. Exit"
    read -p "Choose an option [1-3]: " option
}

# Get user's IP info
get_user_ip_info() {
    local ip=$(curl -s https://api.ipify.org)
    echo "Your IP address is: $ip"
    fetch_ip_info "$ip"
}

# Main script logic
while true; do
    show_menu
    case $option in
        1)
            read -p "Enter the IP address: " ip
            fetch_ip_info "$ip"
            ;;
        2)
            get_user_ip_info
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
