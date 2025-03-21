#!/bin/bash

EWW=$(which eww)

# Wait for the Wayland display to be available
echo starting eww...
while [ -z "$WAYLAND_DISPLAY" ]; do
    echo waiting for wayland display...
    sleep 1
done
echo wayland display found: $WAYLAND_DISPLAY!

# Start eww
$EWW --debug daemon && $EWW open mywindow
