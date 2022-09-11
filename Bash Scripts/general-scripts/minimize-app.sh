#! /bin/bash

# Script searches for all windows with
# the specified string name in the header
# and minimize them.

# Use:        bash ./minimize-app.sh <app-sring-header/app-name>

# Example 1:  bash ./minimize-app.sh "Slack"
# Example 2:  bash ./minimize-app.sh Telegram

APP_NAME=${1}
while [ 1=1 ]
do
    id_window=$(wmctrl -l | grep $APP_NAME | awk '{print $1}')
    if [ $id_window ]; then
        xdotool windowminimize $id_window
        break
    fi
    sleep 1
done
exit 0
