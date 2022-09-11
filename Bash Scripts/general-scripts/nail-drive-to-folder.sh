#! /bin/bash

# The script links the specified hard disk to the specified folder,
# sets read-write rights, transfers the folder to the ownership of
# the specific user who launched the script,
# adds the disk auto-mounting when the system boots.

# Use:          sudo ./nail-drive-to-folder.sh <device> <dir> <fs_type>
# Default:      <fs_type> = ext4

# Example 1:    sudo ./nail-drive-to-folder.sh /dev/sdx1 ~/username/test_dir
# Example 2:    sudo ./nail-drive-to-folder.sh /dev/sdx1 ~/username/test_dir btrfs

DEVICE=$1
DIR=$2
FS_TYPE=$3
USERNAME=$USER
ME=`basename "$0"`

echo "Script $ME started!"

mkdir $DIR
chmod 660 $DIR
mount $DEVICE $DIR
chown -R $USERNAME $DIR

[[ -z "$FS_TYPE" ]] && FS_TYPE="ext4"
echo -e "$DEVICE $DIR $FS_TYPE defaults 0 0\n" >> /etc/fstab

echo "Script $ME completed!"

#
# !!! unail-drive-to-folder !!!
#
# unmount $DEVICE
# rm -rf $DIR
# Remove record in /etc/fstab
#
