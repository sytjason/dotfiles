#!/bin/bash


AMOUNT=5
ACT=$1

get_screen_brightness() {
    brightnessctl | grep Curr | awk '{print $4}' | tr -d '()' | sed 's/.$//'
}

CURRENT_BRIGHTNESS=$(get_screen_brightness)
sleep 0.01

change_brightness() {
    local act
    local current_brightness
    local new_brightness
    act=$1

    case "$act" in
        up)
            new_brightness=$((CURRENT_BRIGHTNESS + AMOUNT))
        ;;
        down)
            new_brightness=$((CURRENT_BRIGHTNESS - AMOUNT))
        ;;
        *)
            echo invalid action
            exit 1
        ;;
    esac

    if [ "$new_brightness" -lt 0 ]; then
        new_brightness=0
    elif [ "$new_brightness" -gt 100 ]; then
        new_brightness=100
    fi

    brightnessctl set "$new_brightness%" > /dev/null 2>&1
}

change_brightness "$ACT"
notify-send -t 1000 -i ~/.config/hypr/icons/brightness.svg "Brightness: $(get_screen_brightness)"

