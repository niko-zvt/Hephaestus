#!/bin/bash

# The starts remote drives using the rclone utility and registers automount services.
# Just add a new sustemd unit description file to the ./Services folder.

# Use:          sudo ./nail-rclone-services.sh

DIR="$(pwd)/Services"
SYSD_DIR="/etc/systemd/system/"
ME=`basename "$0"`

echo "Script $ME started!"

# Do for any *.service in DIR
for FILE in $DIR/*
do
    # 0. Get file name
    filename=$(basename -- $FILE)

    # 1. Copy service file to systemd dir
    cp $FILE $SYSD_DIR
    echo -e "\tCopy $filename to $SYSD_DIR"

    # 2. Enable systemd service
    systemctl enable $filename
    echo -e "\t\tEnable systemd service:\t$filename"

    # 3. Start systemd service
    systemctl start $filename
    echo -e "\t\tStart systemd service:\t$filename"
done

echo "Script $ME completed!"
