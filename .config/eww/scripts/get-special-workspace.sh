#!/usr/bin/env bash
.  $HOME/.config/eww/scripts/utils.sh

special_workspace
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
    while read -r line; do
        if [[ "$line" =~ ^activespecial\>+ ]]; then
            special_workspace
        fi
    done

