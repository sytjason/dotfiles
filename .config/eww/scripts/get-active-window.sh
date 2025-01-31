#!/usr/bin/env bash

.  $HOME/.config/eww/scripts/utils.sh
active_window
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    if [[ "$line" =~ ^workspace\>+    ||
         "$line" =~ ^openwindow\>+    ||
         "$line" =~ ^windowtitlev2\>+ ||
         "$line" =~ ^closewindow\>+   ||
         "$line" =~ ^activewindow\>+   ||
         "$line" =~ ^activespecial\>+ ]]; then
        active_window
    fi
done
