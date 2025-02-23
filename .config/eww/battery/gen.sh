#!/bin/bash
get_bat() {
    acpi -b | awk -F, '{print $2}' | grep -oe "[0-9]*"
}

