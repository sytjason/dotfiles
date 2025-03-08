#!/bin/bash
ACT=$1
usage() {
    echo "Usage: $0 <percent|all>"
    exit 1
}

get_bat_all() {
    acpi -b
}

get_bat() {
    acpi -b | awk -F, '{print $2}' | grep -oe "[0-9]*"
}

case $ACT in
    percent)
        get_bat
        ;;
    all)
        get_bat_all
        ;;
    *)
        usage
        ;;
esac
