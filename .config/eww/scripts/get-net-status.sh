#!/bin/bash
.  $HOME/.config/eww/scripts/utils.sh

ACT=$1

start() {
    local ipaddr
    local intf_list
    local dl_rate
    local ul_rate
    local newline
    local cur_time
    cur_time=$(get_timestamp_ms)
    bmon -o ascii | while read -r net_traffic_line; do
        intf_list="$(get_active_net_interfaces)"
        if [ "$intf_list" != "" ]; then
            while read -r intf; do
                if [[ $net_traffic_line = *$intf* ]]; then
                    [[ $(($(get_timestamp_ms) - cur_time)) -gt 400 ]] && printf "\n"
                    ipaddr=$(awk '{print $4}' <<< "$(ip -o -4 addr show $intf)")
                    dl_rate=$(awk '{print $2}' <<< $net_traffic_line)
                    ul_rate=$(awk '{print $4}' <<< $net_traffic_line)
                    printf "$intf($ipaddr): $dl_rate↓↑$ul_rate|"
                    cur_time=$(get_timestamp_ms)
                fi
            done <<< $intf_list
        fi
        # $newline && printf "\n"
    done
}

stop() {
    killall get-net-status.sh
}

case $ACT in
    start)
        start
        ;;
    stop)
        stop
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac
