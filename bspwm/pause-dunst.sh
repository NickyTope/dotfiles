#!/bin/sh

# pause dunst if the screen is locked with i3lock

checks=1
rm -f /tmp/unlock

notify-send -t 2000 "notifications paused"
sleep 2
notify-send DUNST_COMMAND_PAUSE

while [[ $(ps aux | pgrep -lf i3lock | wc -l) -gt 0 ]]
do
  checks=$((checks+1))
  sleep 2
done

notify-send "notifications resumed"
notify-send DUNST_COMMAND_RESUME

echo "done $checks" > /tmp/unlock
