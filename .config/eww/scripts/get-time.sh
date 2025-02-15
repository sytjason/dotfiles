#!/bin/bash
HOUR=$(($(date +%H) % 12))
MINUTE=$(date +%M)

echo $HOUR-$MINUTE
