#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit
MONITOR=$(polybar -m | tail -1 | sed -e 's/:.*$//g')


source $HOME/.cache/wal/colors.sh
export color0_alpha="#e7${color0/'#'}"

# Launch top bar
echo "---" | tee -a /tmp/polybar1.log
polybar top >> /tmp/polybar1.log 2>&1 &

echo "Bars launched..."
