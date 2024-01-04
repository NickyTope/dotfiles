#!/bin/bash

# acpi -b | awk '{gsub("%", "", $4); print $4}'
# acpi -b | grep -E -o 'Charging|Discharging|Full|Unknown|Not charging'
acpi -b | grep -P -o '[0-9]+(?=%)'

