#! /bin/bash
# Create a cron to execute this however often you'd like.
# This script assumes a lot so make sure you read it before running it.


# Auto-Restart if server crashes.
jpid=$(pgrep "java")

# Regex to check if output is an int.
re='^[0-9]+$'

if ! [[ $jpid =~ $re ]] ; then
        # kill any leftover screen sessions
        pkill screen

        # restart server with proper flags
        screen -d -m java -Xmx2000M -Xms2000M -jar server.jar nogui


        # log the date of any crashes
        date=`date`;
        echo "$date !! The server had to restart! @@" >> guardian_log.txt
else
        date=`date`;
        echo "$date No restart required." >> guardian_log.txt
fi
