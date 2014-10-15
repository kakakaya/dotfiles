#!/bin/sh
if [ -x ~/opt/xcape/xcape -o /usr/bin/xcape ]
then
    xmodmap -e 'keycode 255=space'
    xmodmap -e 'keycode 65=Shift_L'
    xcape -e '#65=space'
else
    echo "xcape not found, SandS didn't activated." 1>&2
fi

