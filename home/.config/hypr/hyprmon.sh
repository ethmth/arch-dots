#!/bin/bash

if ! [[ $EUID -ne 0 ]]; then
        echo "This script should not be run with root/sudo privileges."
        exit 1
fi
CUR_USER=$(whoami)

#REPLACEMENT_TEXT="Here we god \n What's up bruh"
read -p "Put in replacement text: " REPLACEMENT_TEXT

#sed -i '/# HYPRMON_MONSEC_BEGIN/,/# HYPRMON_MONSEC_END/c\This is replacement text\nHere we go' /home/$CUR_USER/.config/hypr/hyprland.conf
sed -i "/# HYPRMON_MONSEC_BEGIN/{:a;N;/# HYPRMON_MONSEC_END/!ba;s/.*/# HYPRMON_MONSEC_BEGIN\n$REPLACEMENT_TEXT\n# HYPRMON_MONSEC_END/}" /home/$CUR_USER/.config/hypr/hyprland.conf
