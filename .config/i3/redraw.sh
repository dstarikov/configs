#!/bin/bash
xrandr
wal --saturate=0.85 -i $HOME/.config/wallpapers/cyberdesk.jpg
i3-msg 'restart'
