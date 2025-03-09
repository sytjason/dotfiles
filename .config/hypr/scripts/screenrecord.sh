#!/bin/bash

notif_and_blink() {
    notify-send "Recording started"
    eww update show_rec=true
    while true; do
        sleep 0.5
        eww update blink_rec=true
        sleep 0.5
        eww update blink_rec=false
    done
}

if [ "$(pgrep wf-recorder)" = "" ]; then
    region=$(slurp)
    notif_and_blink &
    wf-recorder -g "$region" -f $HOME/Videos/recording-$(date +%G-%m-%d-%H%M%S).mkv
    exit 0
else
    notify-send "Recording stopped"
    eww update show_rec=false
    killall wf-recorder
fi

