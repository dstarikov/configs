#!/bin/bash
RESTART=false

while getopts ":r" opt; do
  case ${opt} in
    r ) # process option r
      RESTART=true
      ;;
    \? ) echo "Usage: redraw.sh [-r]"
      ;;
  esac
done

if [ "$RESTART" = true ]; then
  xrandr
fi

wal --saturate=0.85 -s -t -i $HOME/.config/wallpapers/cyberdesk.jpg

if [ "$RESTART" = true ]; then
  i3-msg 'restart'
fi
