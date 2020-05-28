#!/bin/bash
DISPLAY_NUM=0

# find the next available display number for sommelier
while [ -e /tmp/.X11-unix/X$DISPLAY_NUM ]; do
  let DISPLAY_NUM=$DISPLAY_NUM+1
done
SOMMELIER_DISPLAY=$DISPLAY_NUM

# find the next available dispay number for xephyr
let DISPLAY_NUM=$DISPLAY_NUM+1
while [ -e /tmp/.X11-unix/X$DISPLAY_NUM ]; do
  let DISPLAY_NUM=$DISPLAY_NUM+1
done
XEPHYR_DISPLAY=:$DISPLAY_NUM

/usr/sbin/sommelier --x-server=$SOMMELIER_DISPLAY --glamor --shm-driver=virtwl-dmabuf --data-driver=virtwl --application-id="i3" --accelerators="<Alt>tab,Super_L" -X --scale=1.00 Xephyr -name "i3" -class "i3" -title "i3" -br -ac -fullscreen -noreset -resizeable -glamor +iglx $XEPHYR_DISPLAY &
unset DBUS_SESSION_BUS_ADDRESS && unset XDG_RUNTIME_DIR
export TERMINAL=urxvt
sleep 2
source ~/.sommelierrc
export SOMMELIER_DISPLAY=:$SOMMELIER_DISPLAY
DISPLAY=$XEPHYR_DISPLAY i3
killall onboard
killall xclipsync
killall xclipfrom
pkill Xephyr
