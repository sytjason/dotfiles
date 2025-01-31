#!/usr/bin/env bash

.  $HOME/.config/eww/scripts/utils.sh
windows
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    if [[ "$line" =~ ^workspace\>+    ||
         "$line" =~ ^openwindow\>+    ||
         "$line" =~ ^movewindow\>+    ||
         "$line" =~ ^windowtitlev2\>+ ||
         "$line" =~ ^closewindow\>+ ]]; then
        windows
    fi
done
