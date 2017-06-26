#!/bin/ruby

require_relative 'chDisplays'
require_relative 'screenConf'


HandleDisplays.new
ScreenConf.new

`sh ~/.bin/changeWallpaper.sh`
`pkill conky`
`setUSKeyboard`
`openbox --reconfigure`
# `sh ~/.config/conky/conkyrc.start.sh&`
