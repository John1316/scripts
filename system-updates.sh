#!/bin/bash

# Define log file path
LOG_FILE="/var/log/system_logs.log"

# Create or clear the log file at the start of the script
echo "=== System Update and Upgrade Log - $(date) ===" > "$LOG_FILE"

# Function to log messages
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Start the update process
log_message "Starting system update..."

# make system update
if sudo apt update >> "$LOG_FILE" 2>&1; then
    log_message "Packages list updated successfully."
else
    log_message "Packages list updated successfully."
    exit 1
fi

# upgrade packages
log_message "Starting system upgrading packages..."

# sudo apt update -y
if sudo apt upgrade -y >> "$LOG_FILE" 2>&1; then
    log_message "Packages upgraded successfully."
else
    log_message "Packages upgraded successfully."
    exit 1
fi

# Final message
log_message "System update and upgrade process completed."