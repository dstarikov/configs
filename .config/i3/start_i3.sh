#!/bin/bash
/usr/sbin/sommelier --glamor --shm-driver=virtwl-dmabuf --data-driver=virtwl --application-id="i3" --accelerators="<Alt>tab,Super_L" -X --scale=1.00 Xephyr -name "i3" -class "i3" -title "i3" -br -ac -fullscreen -noreset -resizeable -glamor +iglx :3 &
unset DBUS_SESSION_BUS_ADDRESS && unset XDG_RUNTIME_DIR
export TERMINAL=urxvt
sleep 2
DISPLAY=:3 i3
killall onboard
killall xclipsync
killall xclipfrom
pkill Xephyr
