#!/bin/bash

FACT=$(curl --no-progress-meter https://uselessfacts.jsph.pl/api/v2/facts/random\?language\=en | jq .text)
DATE=$()

notify-send  "Welcome `whoami`, it's `date +%A`" "$FACT" --icon=caffeine-cup-full -t 20000
