#!/bin/bash

if [ "$(pgrep wf-recorder)" = "" ]; then
    wf-recorder -g "$(slurp)" -f Videos/recording-$(date +%G-%m-%e-%H%M%S).mkv
else
    killall wf-recorder
fi

