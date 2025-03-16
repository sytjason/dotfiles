#!/bin/bash

is_offline() {
    [[ $(nmcli -t -f CONNECTIVITY general) == "none" ]]
}

check_conn_type() {
    local type
    type=$(nmcli -t -f DEVICE,TYPE connection show --active | head -n 1)

    if is_offline; then
        echo "offline"
    elif [[ "$type" == *"wireless"* ]]; then
        echo "wifi"
    elif [[ "$type" == *"ether"* ]]; then
        echo "ether"
    fi
}

dbus-monitor --system "type='signal',interface='org.freedesktop.NetworkManager'" |
while read -r _; do
    check_conn_type
done
