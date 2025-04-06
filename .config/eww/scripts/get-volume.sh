#!/bin/bash

LAST_VOLUME=$(pamixer --get-volume)
IS_MUTE=$(pamixer --get-mute)
echo "{\"volume\": $LAST_VOLUME, \"mute\": $IS_MUTE}"
pactl subscribe | grep --line-buffered sink |
while read -r _; do
    NEW_VOLUME=$(pamixer --get-volume)
    IS_MUTE=$(pamixer --get-mute)
    echo "{\"volume\": $NEW_VOLUME, \"mute\": $IS_MUTE}"
    DIFF=$((NEW_VOLUME - LAST_VOLUME))
    if [[ $NEW_VOLUME -eq 0 ]] || $IS_MUTE; then
        notify-send "Volume: mute" -t 1000 -i $HOME/.config/eww/volume/volume-no.svg
    elif [[ $DIFF -gt 0 ]]; then
        notify-send "Volume: $NEW_VOLUME%" -t 1000 -i $HOME/.config/eww/volume/volume-up.svg
    elif [[ $DIFF -lt 0 ]]; then
        notify-send "Volume: $NEW_VOLUME%" -t 1000 -i $HOME/.config/eww/volume/volume-down.svg
    fi
    LAST_VOLUME=$NEW_VOLUME
done
