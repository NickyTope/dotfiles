#!/bin/bash

if [ $# -eq 1 ]; then
  pulsemixer --change-volume $1
fi

NOTIFY_ID=0

if [ -f /tmp/vol ]; then
  NOTIFY_ID=$(cat /tmp/vol)
fi

VOLUME=$(pulsemixer --get-volume | awk '{print $1}')

ICON=audio-volume-low
if [ "$VOLUME" -ge "50" ]; then
  ICON=audio-volume-high
elif [ "$VOLUME" -ge "20" ]; then
  ICON=audio-volume-medium
fi

PROG="═══════════\\n"
for ((i = 0 ; i < 101 ; i+=10)); do
  if [ "$VOLUME" -eq 0 ]; then
    PROG="$PROG"
  elif [ "$VOLUME" -ge "$i" ]; then
    PROG="$PROG█"
  elif [ "$VOLUME" -ge $(($i-5)) ]; then
    PROG="$PROG▌"
  # else
    # PROG="$PROG▁"
  fi
done
PROG="$PROG\\n═══════════"


NEW_ID=$(notify-send  "volume - ${VOLUME}" "${PROG}" --print-id --replace-id=${NOTIFY_ID} --icon=${ICON} --urgency=low --expire-time=1000)

echo $NEW_ID > /tmp/vol

