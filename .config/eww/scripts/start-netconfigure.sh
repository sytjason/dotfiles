#!/bin/bash

hyprctl dispatch exec "[float] alacritty -e bash -c 'nmcli device wifi list >/dev/null 2>&1 && nmtui'"
