#!/bin/bash

LAST_VOLUME=$(pamixer --get-volume)
pactl subscribe | grep --line-buffered sink |
while read -r _; do
    NEW_VOLUME=$(pamixer --get-volume)
    echo $NEW_VOLUME
    DIFF=$((NEW_VOLUME - LAST_VOLUME))
    if [[ $NEW_VOLUME -eq 0 ]]; then
        notify-send "" -t 1000 -i $HOME/.config/eww/volume/volume-no.svg
    elif [[ $DIFF -gt 0 ]]; then
        notify-send "" -t 1000 -i $HOME/.config/eww/volume/volume-up.svg
    elif [[ $DIFF -lt 0 ]]; then
        notify-send "" -t 1000 -i $HOME/.config/eww/volume/volume-down.svg
    fi
    LAST_VOLUME=$NEW_VOLUME
done
