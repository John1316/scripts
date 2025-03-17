#!/bin/bash
LOG_DIR="/var/log/"
# Define the name for the compressed archive
ARCHIVE_NAME="logs_compressed_$(date +%Y-%m-%d-%H-%M).tar.gz"
ARCHIVE_DAYS=7
# Find log files older than 7 days and add them to a tar.gz archive
(cd "$LOG_DIR" && find . -type f -name "*.log" -mtime +"$ARCHIVE_DAYS" -print0 | tar --null -czf "$ARCHIVE_NAME" --files-from -)

echo "Log files older than $ARCHIVE_DAYS days have been archived as $ARCHIVE_NAME."