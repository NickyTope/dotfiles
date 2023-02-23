#!/bin/bash

# ip a show scope global | grep inet | awk '{ print $2 }' | grep -v "\b172" | sed 's|/.*||'

# https://www.tutorialspoint.com/awk/awk_string_functions.htm

# split the string into an array, creates array called parts
# ip a show scope global | grep inet | grep -v "\b172" | awk '{ split($2, parts, "/"); print parts[1] }'

# substitute "/" to end of line (replaces the value of $2)
ip a show scope global | grep inet | grep -v "\b172" | awk '{ sub(/\/.*$/, "", $2); print $2 }'
