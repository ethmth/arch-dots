#!/bin/bash

MONITOR=$(hyprctl activeworkspace | grep monitor | grep -v "monitorID:" | rev | cut -d' ' -f1 | rev | cut -d':' -f1 | tr -s ' ')
grim -o $MONITOR /tmp/shot.png
wlogout --protocol layer-shell -b 4 -T 400 -B 400
#magick /tmp/shot.png -blur 0x8 /tmp/shot_blurred.png

