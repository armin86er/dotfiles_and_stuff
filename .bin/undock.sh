#!/bin/bash
xrandr --output eDP1 --auto && 
xrandr --output DP2-2 --off && 
xrandr --output DP1 --off &&
#xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' && 
pkill conky & sleep 1s && 
sh ~/.bin/changeWallpaper.sh &&
sh .conky/ActiveSet/conkyrc.start.sh &&
ruby ~/.bin/obScreenConf.rb &&
openbox --reconfigure
