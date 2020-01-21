#!/bin/bash
/usr/sbin/sommelier --accelerators="<Alt>tab,Super_L" -X --scale=0.83 --dpi=293 Xephyr -name "i3" -title "i3" -br -ac -fullscreen -noreset -resizeable -screen 3000x2000 -dpi 230 -glamor +iglx :3 &
unset DBUS_SESSION_BUS_ADDRESS && unset XDG_RUNTIME_DIR
sleep 1	
DISPLAY=:3 xcape -e "Control_L=Escape"
# xclipsync should be using MAIN=:2
DISPLAY=:3 xclipsync &
DISPLAY=:3 autocutsel &
DISPLAY=:3 i3
pkill Xephyr
