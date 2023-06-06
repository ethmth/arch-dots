#!/bin/bash

DEVICE="laptop" # Must match directory in .config/hypr/presets/

if ! [[ $EUID -ne 0 ]]; then
        echo "This script should not be run with root/sudo privileges."
        exit 1
fi
CUR_USER=$(whoami)

FILE=""
if [ $# -eq 1 ]; then
	FILE=$1
elif [ $# -gt 1 ]; then
    echo "Usage: hyprmon <preset>"
	exit 1
else
	FILE=$(ls -1 /home/$CUR_USER/.config/hypr/presets/$DEVICE | fzf --prompt="Select a monitor preset")	
fi

if ! [ -f "/home/$CUR_USER/.config/hypr/presets/$DEVICE/$FILE" ]; then
	echo "File does not exist."
	exit 1
fi

REPLACEMENT_TEXT=$(cat /home/$CUR_USER/.config/hypr/presets/$DEVICE/$FILE)
REPLACEMENT_TEXT=$(echo "$REPLACEMENT_TEXT" | sed ':a;N;$!ba;s/\n/\\n/g')

sed -i "/# HYPRMON_MONSEC_BEGIN/{:a;N;/# HYPRMON_MONSEC_END/!ba;s/.*/# HYPRMON_MONSEC_BEGIN\n$REPLACEMENT_TEXT\n# HYPRMON_MONSEC_END/}" /home/$CUR_USER/.config/hypr/hyprland.conf
