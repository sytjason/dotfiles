#!/bin/bash

if [ "$(pgrep wf-recorder)" = "" ]; then
    wf-recorder -g "$(slurp)" -f $HOME/Videos/recording-$(date +%G-%m-%d-%H%M%S).mkv
else
    killall wf-recorder
fi

