#!/bin/bash

ACT=$1

case "$ACT" in
    cp) grim -g "$(slurp)" - | wl-copy
    ;;
    save) grim -g "$(slurp)"  ~/Pictures/screenshot-$(date +%G-%m-%e-%H%M%S).png
    ;;
    *) echo invalid action: $ACT
    ;;
esac



