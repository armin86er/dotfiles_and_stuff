#!/bin/ruby

require_relative 'handleDisplays'
require_relative 'screenConf'


HandleDisplays.new
ScreenConf.new

# `sh ~/.bin/changeWallpaper.sh`
`DISPLAY=:0 feh --bg-scale /home/armin/Pictures/.wallpaper/file652.jpg` #Fuechse
`pkill conky`
`setUSKeyboard`
`openbox --reconfigure`

`sh ~/.config/conky/conkyrc.start.sh > /dev/null 2> /dev/null #start Conky`

asdf
