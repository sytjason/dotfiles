#!/bin/bash

EWW=$(which eww)

if pgrep eww > /dev/null 2>&1; then
    $EWW kill
fi

monitors=$(hyprctl monitors -j | jq '.[] | .id')
# monitors=$(hyprctl monitors -j | jq '.[] | .id' | wc -l)

# Start eww
$EWW daemon

while read -r monitor; do
    eww open mywindow --screen $monitor
done <<< $monitors

