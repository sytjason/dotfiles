#!/bin/bash

dbus-monitor --system "type='signal',interface='org.freedesktop.NetworkManager'" |
while read -r line; do
    echo "NetworkManager state changed"
    connection_status=$(nmcli -t -f STATE general)
    is_wifi=$(nmcli -t -f DEVICE,TYPE connection show --active | grep wireless)
    is_ethernet=$(nmcli -t -f DEVICE,TYPE connection show --active | grep ether)
    # TODO: multiple connections

    # if [[ "$connection_status" == "connected" ]]; then
    #     echo "Connected"
    # else
    #     echo "Disconnected"
    # fi
done
