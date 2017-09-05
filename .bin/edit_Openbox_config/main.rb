#!/bin/ruby

require_relative 'handleDisplays'
require_relative 'screenConf'


HandleDisplays.new
ScreenConf.new

`sh ~/.bin/changeWallpaper.sh`
`pkill conky`
`setUSKeyboard`
`openbox --reconfigure`

`sh ~/.config/conky/conkyrc.start.sh > /dev/null 2> /dev/null #start Conky`
