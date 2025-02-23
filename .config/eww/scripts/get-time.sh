#!/bin/bash
ACT=$1
HOUR=$(($(date +%-H) % 12))
MINUTE=$(date +%-M)

case "$ACT" in
    all) date --rfc-3339 seconds
    ;;
    time) echo $HOUR-$MINUTE
    ;;
    *) echo invalid input; exit 1
    ;;
esac


