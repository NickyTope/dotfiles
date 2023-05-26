#!/bin/env bash

bluetoothctl info EC:BC:0A:FA:E5:CA | grep "Battery Percentage" | awk '{ gsub(/[()]/,""); print $4}'
