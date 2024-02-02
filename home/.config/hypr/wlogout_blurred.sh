#!/bin/bash
grim /tmp/shot.png
magick /tmp/shot.png -blur 0x8 /tmp/shot_blurred.png
wlogout --protocol layer-shell -b 5 -T 400 -B 400
