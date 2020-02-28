#!/bin/bash
/usr/sbin/sommelier --accelerators="<Alt>tab,Super_L" -X --scale=1.00 Xephyr -name "i3_name" -title "i3" -br -ac -fullscreen -noreset -resizeable -glamor +iglx :3 &
unset DBUS_SESSION_BUS_ADDRESS && unset XDG_RUNTIME_DIR
sleep 1	
export TERMINAL=urxvt
DISPLAY=:3 i3
killall xclipsync
killall xclipfrom
killall onboard
pkill Xephyr
