#!/bin/sh

feh --bg-scale /home/tkilian/Pictures/bg2.jpg &
xrandr --output VGA1 --right-of HDMI1 &
/usr/lib/notify-osd/notify-osd &
numlockx on &
setxkbmap -layout de &

# exec i3
exec xmonad
