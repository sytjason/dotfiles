#!/usr/bin/env bash
. $HOME/.config/eww/scripts/utils.sh

spaces
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    if [[ "$line" =~ ^workspace\>+ ]]; then
        spaces
    fi
done
