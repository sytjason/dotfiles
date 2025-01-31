#!/bin/sh

syncthing serve --no-browser --logfile=/home/jason/.local/state/syncthing/syncthing.log &

/usr/bin/logseq && sleep 5 && killall syncthing
