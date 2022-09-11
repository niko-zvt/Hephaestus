#!/bin/bash

# The stops remote drives using the rclone utility and unregisters automount services.
# Just add a new sustemd unit description file to the ./Services folder.

# Use:          sudo ./unail-rclone-services.sh

DIR="$(pwd)/Services"
SYSD_DIR="/etc/systemd/system/"
ME=`basename "$0"`

echo "Script $ME started!"

# Do for any *.service in DIR
for FILE in $DIR/*
do
    # 0. Get file name
    filename=$(basename -- $FILE)

    # 3. Stop systemd service
    systemctl stop $filename
    echo -e "\t\tStop systemd service:\t$filename"

    # 2. Disable systemd service
    systemctl disable $filename
    echo -e "\t\tDisable systemd service:\t$filename"

    # 1. Remove service file from systemd dir
    rm -rf $SYSD_DIR/$filename
    echo -e "\tRemove $filename from $SYSD_DIR"
done

echo "Script $ME completed!"
