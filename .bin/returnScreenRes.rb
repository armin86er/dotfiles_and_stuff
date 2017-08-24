#!/usr/bin/ruby
@x, @y = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
puts @x
