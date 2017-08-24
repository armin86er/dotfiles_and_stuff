#!/bin/bash
file=$(find /home/armin/Pictures/.wallpaper/ -type f | shuf -n1) && echo $file > /home/armin/.bin/background.txt && DISPLAY=:0 feh --bg-scale $file
