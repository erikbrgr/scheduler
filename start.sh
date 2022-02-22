#!/bin/bash

if [ -z "$SCHEDULER_ENVIRONMENT" ]; then
   echo "SCHEDULER_ENVIRONMENT not set, assuming Development"
   SCHEDULER_ENVIRONMENT="Development"
fi

# Select the crontab file based on the environment
CRON_FILE="crontab.$SCHEDULER_ENVIRONMENT"

echo "Loading crontab file: $CRON_FILE"

# Remove commented-out lines
grep -v '^#' $CRON_FILE

# Load the crontab file
crontab $CRON_FILE

echo "Starting cron..."

# Start cron
crond -f