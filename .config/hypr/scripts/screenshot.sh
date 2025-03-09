#!/bin/bash

ACT=$1

case "$ACT" in
    cp) 
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot copied to clipboard"
    ;;
    save)
        grim -g "$(slurp)"  ~/Pictures/screenshot-$(date +%G-%m-%e-%H%M%S).png
        notify-send "Screenshot saved to ~/Pictures"
    ;;
    *) echo invalid action: $ACT
    ;;
esac



