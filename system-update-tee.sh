#!/bin/bash

# Define log file path
LOG_FILE="/var/log/system_logs_$(date +%Y-%m-%d-%H-%M).log"

# Create or clear the log file at the start of the script
echo "=== System Update and Upgrade Log - ===" > "$LOG_FILE"

# Start the update process
echo "Starting system update..."

# make system update
sudo apt update 2>&1 | tee -a $LOG_FILE;
    echo "Packages list updated successfully."


# upgrade packages
echo "Starting system upgrading packages..."

sudo apt upgrade -y 2>&1 | tee -a $LOG_FILE;
    echo "Packages upgraded successfully."

# Final message
echo "System update and upgrade process completed."