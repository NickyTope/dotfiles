#!/bin/bash

FACT=$(curl --no-progress-meter https://uselessfacts.jsph.pl/random.txt\?language\=en | head -n 1)
DATE=$()

notify-send  "Welcome `whoami`, it's `date +%A`" "$FACT" --icon=caffeine-cup-full -t 8000
