#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# polybar top &
for m in $(polybar --list-monitors | cut -d":" -f1); do
  # MONITOR=$m polybar --reload top &
  MONITOR=$m polybar -c ~/.config/polybar/config.new --reload main &
done

polybar --reload tray

echo "Polybar launched..."
